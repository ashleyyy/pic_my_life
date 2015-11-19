#HELPERS
helpers do
  def current_user () User.find(session[:user_id]) if session[:user_id] end
end

#PHOTOS/MAIN PAGE
get '/' do
  @photos = Photo.all
  erb :'photos/index'
end

get '/photos/new' do
  @photo = Photo.new
  erb :'photos/new'
end

get '/photos/:id' do
  @photo = Photo.find params[:id]
  erb :'photos/show'
end

post '/photos/create' do
  photo = current_user.photos.new(
    caption:  params[:caption],
    url: params[:url],
  )
  if photo.save
    redirect '/'
  else
    erb :'photos/new'
  end
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

