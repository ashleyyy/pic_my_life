before do
  current_user
end

get '/' do
  @photos = Photo.order(created_at: :desc)
  erb :'index'
end