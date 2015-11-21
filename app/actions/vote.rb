post '/photos/:id/votes' do |id|
  photo = Photo.find(id)
  photo.votes.create(
    user_id: @current_user.id,
    context: params[:choice]
    )
  redirect back
end

delete '/photos/:id/votes' do |id|
  vote = Photo.find(id).votes.where(user_id: @current_user.id).where(context: params[:choice]).first
  vote.destroy
  redirect back
end