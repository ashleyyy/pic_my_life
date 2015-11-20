before do
  current_user
end

get '/' do
  @photos = Photo.all
  erb :'index'
end