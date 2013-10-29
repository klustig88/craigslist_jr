get '/' do
  @category = Category.all
  erb :index
end

get '/category/:id' do
   @category = Category.find(params[:id])
   @posts = @category.posts
   erb :category
end 

get '/edit/:id' do
  @post= Post.find(params[:id])
  erb :create_post
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :posts 
end 

get "/create_post/:id" do
  erb :create_post
end

post "/delete/:id" do
   @posts_to_delete = Post.find(params[:id])
   @posts_to_delete.destroy
   redirect '/'
end 


post "/update_post/:id" do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect "/post/#{@post.id}"
end

post "/create_post/:id" do
  post = Post.new(params[:post]) 
  post.category_id = params[:id]
  post.save
  p post
  redirect "/post/#{post.id}"
end

