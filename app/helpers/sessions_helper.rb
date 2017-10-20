module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #check if a user is logged_in (if current user is not nil)
  def logged_in?
    current_user
  end

  #undo the effects of log_in et reset le @current_user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
