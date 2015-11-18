# Homepage (Root path)
get '/' do
  erb :index
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


