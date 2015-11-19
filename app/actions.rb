#HELPERS
helpers do
  def current_user
   User.find(session[:user_id]) if session[:user_id]
  end
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
  @photo = current_user.photos.new(params[:photo])
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

#USER/SESSIONS
get '/signup' do
  @user = User.new
  erb :signup
end

get '/signin' do
  erb :signin
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

