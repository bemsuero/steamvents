class SessionsController < ApplicationController
  def new
  end

  def create_guest
    guest = GuestUser.find_by(email: params[:session][:email].downcase)
    guest_log_in(guest)
  end

  def destroy_guest
    session[:guest_id] = nil
    guest_log_out if guest_logged_in?
    p "logged out successfully"
    redirect_to root_path
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      msg = "Invalid Credentials"
      p msg
    redirect_to root_path
    end
  end


  def destroy
    session[:user_id] = nil
    log_out if logged_in?
    p "logged out successfully"
    redirect_to root_path
  end

end
