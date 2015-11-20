post '/photos/:id/votes' do |id|
  photo = Photo.find(id)
  photo.votes.create(
    user_id: @current_user.id,
    context: params[:choice]
    )
  redirect '/photos'
end