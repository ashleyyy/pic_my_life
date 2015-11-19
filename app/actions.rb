#HELPERS
helpers do

  def current_user
   @current_user = User.find(session[:user_id]) if session[:user_id]
  end

end

before do
  current_user
end

# INDEX PAGE
get '/' do
  erb :'index'
end

# PHOTOS
get '/photos' do
  @photos = Photo.all
  erb :'photos/index'
end

get '/photos/new' do
  @photo = Photo.new
  erb :'photos/new'
end

post '/photos' do
  @photo = @current_user.photos.new(params[:photo])
  if @photo.save
    redirect '/photos'
  else
    erb :'photos/new'
  end
end

get '/photos/:id' do |id|
  @photo = Photo.find(id)
  erb :'photos/show'
end

# SIGN/LOGIN
get '/signup' do
  @user = User.new
  erb :signup
end

get '/signin' do
  erb :signin
end

get '/signout' do
  session.clear
  redirect '/photos'
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/photos'
  else
    erb :'/signup'
  end
end

post '/signin' do
  @user = User.find_by(params[:user])
  if @user
    session[:user_id] = @user.id
    redirect '/photos'
  else
    @signin_name = params[:user][:username]
    @error = "Incorrect username or password."
    erb :'/signin'
  end
end

# VOTES
get '/photos/:id/votes/funny' do
  photo = Photo.find(params[:id])
  photo.votes.create(
    user_id: current_user.id,
    context: 'funny'
  ) if current_user
  redirect "/"
end

get '/photos/:id/votes/shameful' do
  photo = Photo.find(params[:id])
  photo.votes.create(
    user_id: current_user.id,
    context: 'shameful'
  ) if current_user
  redirect "/"
end

