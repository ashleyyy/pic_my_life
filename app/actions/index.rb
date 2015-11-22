before do
  current_user
end

get '/' do
  @photos = Photo.limit(30).order(created_at: :desc)
  erb :'index'
end