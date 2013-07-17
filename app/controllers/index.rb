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
  # params[:post]
  # p params[:id]
  # p "#{params[:post]}"
  # hash = { params[:post], category_id: params[:id] }
  # p hash
  @post = Post.create( params[:post] )
  erb :"post/show"
  
  
end

# Post#show
get '/categories/:id/posts/:postid' do
  @category = Category.find(params[:id])
  @post = Post.find(params[:postid])
  erb :"post/show"
end







