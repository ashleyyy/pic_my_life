helpers do
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    begin
      @current_user = User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  end

  def can_vote?(photo, context)
    if logged_in?
      @current_user.votes.find_by(photo_id: photo.id, context: context).nil?
    else
      false
    end
  end

end