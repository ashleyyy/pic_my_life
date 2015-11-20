# HELPERS
# helpers do

#   def current_user
#     begin
#       @current_user = User.find(session[:user_id]) if session[:user_id]
#     rescue ActiveRecord::RecordNotFound
#       session[:user_id] = nil
#     end
#   end

#   def can_vote?(photo, context)
#     @current_user.votes.find_by(photo_id: photo.id, context: context).nil?
#   end

# end


# before do
#   current_user
# end

<<<<<<< HEAD
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

post '/photos/?' do
  @photo = @current_user.photos.new(params[:photo]) if @current_user
  if @photo.save
    redirect '/photos'
  else
    erb :'photos/new'
  end
end

get '/photos/:id/?' do |id|
  begin
    @photo = Photo.find(id)
    erb :'photos/show'
  rescue ActiveRecord::RecordNotFound
    redirect '/photos'
  end
end
=======
# # INDEX PAGE
# get '/' do
#   erb :'index'
# end

# PHOTOS
# get '/photos/?' do
#   @photos = Photo.all
#   erb :'photos/index'
# end

# get '/photos/new/?' do
#   @photo = Photo.new
#   erb :'photos/new'
# end

# post '/photos/?' do
#   @photo = @current_user.photos.new(params[:photo]) if @current_user
#   if @photo.save
#     redirect '/photos'
#   else
#     erb :'photos/new'
#   end
# end

# get '/photos/:id/?' do |id|
#   begin
#     @photo = Photo.find(id)
#     erb :'photos/show'
#   rescue ActiveRecord::RecordNotFound
#     redirect '/photos'
#   end
# end

# SIGN/LOGIN
# get '/signup/?' do
#   @user = User.new
#   erb :signup
# end

# post '/signup' do
#   @user = User.new(params[:user])
#   if @user.save
#     session[:user_id] = @user.id
#     redirect '/photos'
#   else
#     erb :'/signup'
#   end
# end

# get '/signin/?' do
#   erb :signin
# end

# post '/signin' do
#   @user = User.find_by(params[:user])
#   if @user
#     session[:user_id] = @user.id
#     redirect '/photos'
#   else
#     @signin_name = params[:user][:username]
#     @error = "Incorrect username or password."
#     erb :'/signin'
#   end
# end

# get '/signout/?' do
#   session.clear
#   redirect '/photos'
# end

# VOTES
# post '/photos/:id/votes' do |id|
#   photo = Photo.find(id)
#   photo.votes.create(
#     user_id: @current_user.id,
#     context: params[:choice]
#     )
#   redirect '/photos'
# end
