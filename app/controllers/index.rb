get '/' do
  # Look in app/views/index.erb
  @categories = Category.all
  erb :index
end

get '/:category' do
  category = Category.find_by_name(params[:category])
  @posts = category.posts

  erb :category
end
