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

get '/signout/?' do
  session.clear
  redirect '/photos'
end