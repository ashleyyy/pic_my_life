# Rank by Most Funny votes
get '/photos/funny' do
  @photos = Photo.joins("LEFT JOIN votes ON photos.id = votes.photo_id").
            where("votes.context = 'funny'").
            select("photos.*, count(votes.context) as funny_count").
            group("photos.id").order("funny_count desc")
  erb :'/index'
end

# Rank by Most Shameful votes
get '/photos/shameful' do
  @photos = Photo.joins("LEFT JOIN votes ON photos.id = votes.photo_id").
            where("votes.context = 'shameful'").
            select("photos.*, count(votes.context) as shameful_count").
            group("photos.id").order("shameful_count desc")
  erb :'/index'
end

# Show one random Photo
get '/photos/random' do
  @photo = Photo.order("RANDOM()").first
  erb :'photos/show'
end

# Photos index page
get '/photos' do
  @photos = Photo.order(created_at: :asc)
  erb :'photos/index'
end

get '/photos/new/?' do
  @photo = Photo.new
  erb :'photos/new'
end

# post '/photos/?' do
#   @photo = @current_user.photos.new(params[:photo]) if @current_user
#   if @photo.save
#     redirect '/photos'
#   else
#     erb :'photos/new'
#   end
# end

get '/photos/:id/?' do |id|
  begin
    @photo = Photo.find(id)
    erb :'photos/show'
  rescue ActiveRecord::RecordNotFound
    redirect '/photos'
  end
end

post '/photos/upload' do
  p = Photo.create(user_id: @current_user.id, caption: params[:caption])
  p.file = params[:upload]
  p.save!
  redirect '/'
end