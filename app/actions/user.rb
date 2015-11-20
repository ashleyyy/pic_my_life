get '/users/:id/?' do |id|
 begin
   @user = User.find(id)
   erb :'users/show'
 rescue ActiveRecord::RecordNotFound
   redirect '/photos'
 end
end