# Categories

# Category#index
get '/' do
  # Look in app/views/index.erb
  @categories = Category.all
  erb :index
end

    # Category#index (redirect)
    get '/categories' do 
      redirect to("/")
    end

# Category#new
get '/categories/new' do
  erb :"category/new"
end

# Category#create
post '/' do
  Category.create(params[:category])
  redirect to("/")
end

# Category#show
get '/categories/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts
  erb :"category/show"
end

# Category#edit
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb :"category/edit"
end

# Category#update
post '/categories/:id' do
  @category = Category.find(params[:id])
  @category.update_attributes(params[:category])
  redirect to("/")
end

# Category#delete
get '/categories/:id/delete' do
  @category = Category.find(params[:id])
  @category.destroy
  redirect to('/')
end


# Posts

# Post#index (scoped under categories)

# Post#new
get '/categories/:id/posts/new' do
  @category = Category.find(params[:id])
  erb :"post/new"
end

# Post#create
post '/categories/:id/posts' do
  @post = Post.create( params[:post] )
  redirect to("/categories/#{params[:id]}/posts/#{@post.id}")
end

# Post#show
get '/categories/:id/posts/:postid' do
  @category = Category.find(params[:id])
  @post = Post.find(params[:postid])
  erb :"post/show"
end

# Post#edit
get '/categories/:id/posts/:postid/edit' do
  @category = Category.find(params[:id])
  @post = Post.find(params[:postid])
  erb :"post/edit"
end

# Post#update
post '/categories/:id/posts/:postid' do 
  @post = Post.find( params[:postid] )
  @post.update_attributes( params[:post] )
  redirect to("/categories/#{params[:id]}/posts/#{@post.id}")
end

# Post#delete
get '/categories/:id/posts/:postid/delete' do
  @post = Post.find(params[:postid])
  @post.destroy
  redirect to("/categories/#{params[:id]}")
end







