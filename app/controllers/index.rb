get '/' do
  # Look in app/views/index.erb
  @categories = Category.all
  erb :index
end

post '/' do
  Category.create(params[:category])
  redirect to("/")
end

get '/categories' do 
  redirect to("/")
end

get '/categories/new' do
  erb :"category/new"
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts
  erb :"category/show"
end

get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb :"category/edit"
end

post '/categories/:id' do
  @category = Category.find(params[:id])
  @category.update_attributes(params[:category])
  redirect to("/")
end

get '/categories/:id/delete' do
  @category = Category.find(params[:id])
  @category.destroy
  redirect to('/')
end

get '/categories/:id/posts/new' do
  erb :"post/new"
end

get '/categories/:id/posts/:postid' do
  @post = Post.find(params[:postid])
  params.inspect
  erb :"post/show"
end

# get '*' do 
#   redirect to('/')
# end
