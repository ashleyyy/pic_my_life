post '/photos/:id/votes' do |id|
  photo = Photo.find(id)
  photo.votes.create(
    user_id: @current_user.id,
    context: params[:choice]
    )
  if back == "http://localhost:3001/photos/random"
    redirect "photos/#{photo.id}"
  else
    redirect back
  end
end

delete '/photos/:id/votes' do |id|
  vote = Photo.find(id).votes.where(user_id: @current_user.id).where(context: params[:choice]).first
  vote.destroy
  redirect back
  if back == "http://localhost:3001/photos/random"
    redirect "photos/#{photo.id}"
  else
    redirect back
  end
end