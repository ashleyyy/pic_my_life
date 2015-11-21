# Rank by Most Funny votes
get '/photos/funny' do
  @photos = Photo.select("photos.*, count(CASE WHEN context='funny' THEN 1 END) as funny_count").
            joins("LEFT JOIN votes ON photos.id = votes.photo_id").  
            group("photos.id").order("funny_count desc")
  erb :'/index'
end

# Rank by Most Shameful votes
get '/photos/shameful' do
  @photos = Photo.select("photos.*, count(CASE WHEN context='shameful' THEN 1 END) as shameful_count").
            joins("LEFT OUTER JOIN votes ON photos.id = votes.photo_id").
            group("photos.id").order("shameful_count desc")
  erb :'/index'
end

# Rank by Most Votes
get '/photos/total' do
  @photos = Photo.joins("LEFT OUTER JOIN votes ON photos.id = votes.photo_id").
            group("photos.id").order("count(votes.id) desc")
  erb :'/index'
end

# Show one random Photo
get '/photos/random' do
  @photo = Photo.order("RANDOM()").first
  erb :'photos/show'
end

# Photos index page
get '/photos' do
  @photos = Photo.order(created_at: :desc)
  erb :'photos/index'
end

get '/photos/new/?' do
  @photo = Photo.new
  erb :'photos/new'
end

get '/photos/:id/?' do |id|
  begin
    @photo = Photo.find(id)
    @user = User.find_by(id: @photo.user_id)
    @photoroll = Photo.where(user_id:  @user.id)
    erb :'photos/show'
  rescue ActiveRecord::RecordNotFound
    redirect '/photos'
  end
end

post '/photos/upload' do
  p = Photo.create(user_id: @current_user.id, caption: params[:caption])
  p.file = params[:upload]
  if p.save
   redirect '/'
  else
    @photo = p
    erb :'photos/new'
  end
end