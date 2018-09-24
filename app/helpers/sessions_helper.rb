module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def guest_log_in(guest)
    session[:guest_id] = guest.id
  end

  def current_guest
    @current_guest ||= GuestUser.find_by(id: session[:guest_id]) if session[:guest_id]
  end

  def guest_logged_in?
    !current_guest.nil?
  end

  def guest_log_out
    session.delete(:guest_id)
    @current_guest = nil
  end

end
