get '/photos/?' do
  @photos = Photo.all
  erb :'photos/index'
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