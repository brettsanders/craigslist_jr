get '/' do
  # Look in app/views/index.erb
  @categories = Category.all
  erb :index
end

post '/' do
  Category.create(params[:category])
  redirect to("/")
end

get '/categories/new' do
  erb :new
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  erb :show
end
