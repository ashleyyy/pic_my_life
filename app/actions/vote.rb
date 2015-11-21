post '/photos/:id/votes' do |id|
  photo = Photo.find(id)
  photo.votes.create(
    user_id: @current_user.id,
    context: params[:choice]
    )
  redirect back
end

delete '/photos/:id/votes' do |id|
  photo = Photo.find(id)
  # binding.pry
  vote = photo.votes.where(user_id: @current_user.id).where(context: params[:choice])
  vote.destroy
  redirect back
end