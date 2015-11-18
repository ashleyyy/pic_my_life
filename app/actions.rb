#PHOTOS/MAIN PAGE
get '/' do
  @pictures = Picture.all
  erb :'index'
end

get '/photos/new' do
  @photos = Photo.new
  erb :'photos.new'
end

get '/photos/:id' do
  @photo = Photo.find params[:id]
  erb :'photos/:id'
end

post '/photos/new' do
  photo = current_user.photos.new(
    user_id: params[:user_id],
    caption:  params[:caption],
    url: params[:url],
  )
  if photo.save
    erb :'photos/:id'
  else
    erb :'photos/new'
  end
end

#USER/SESSIONS
get '/signup' do
  @user = User.new
  erb :signup
end

get '/signout' do
  session.clear
  redirect '/'
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )
  if @user.save
    redirect '/'
  else
    erb :'/signup'
  end
end

post '/signin' do
  user = User.find_by(username: params[:username], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/signin'
  end
end

