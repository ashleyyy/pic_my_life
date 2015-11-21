# HELPERS
helpers do

  def current_user
    begin
      binding.pry
      @current_user = User.find(session[:user_id]) if session[:user_id]
      binding.pry
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  end

  def can_vote?(photo, context)
    @current_user.votes.find_by(photo_id: photo.id, context: context).nil?
  end

end

before do
  current_user
end

# INDEX PAGE
get '/' do
  @photos = Photo.all
  erb :'index'
end

# PHOTOS
get '/photos/?' do
  @photos = Photo.all
  erb :'index'
end

get '/photos/new/?' do
  @photo = Photo.new
  erb :'photos/new'
end

get '/photos/:id/?' do |id|
  begin
    @photo = Photo.find(id)
    erb :'photos/show'
  rescue ActiveRecord::RecordNotFound
    redirect '/photos'
  end
end

post '/photos/upload' do
  p = Photo.create(user_id: @current_user.id, caption: params[:caption], file: params[:upload])
  redirect '/'
end

# SIGN/LOGIN
get '/signup/?' do
  @user = User.new
  erb :signup
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

get '/signin/?' do
  erb :signin
end

post '/signin' do
  @user = User.find_by(username: params[:username], password: params[:password])
  binding.pry
  if @user
    binding.pry
    session[:user_id] = @user.id
    redirect '/photos'
    binding.pry
  else
    binding.pry
    @signin_name = params[:username]
    @error = "Incorrect username or password."
    binding.pry
    erb :'/signin'
  end
end

get '/signout/?' do
  session.clear
  redirect '/photos'
end

# VOTES
post '/photos/:id/votes' do |id|
  photo = Photo.find(id)
  photo.votes.create(
    user_id: @current_user.id,
    context: params[:choice]
    )
  redirect '/photos'
end
