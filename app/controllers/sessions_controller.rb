class SessionsController < ApplicationController
  def new
  end

  def create_guest
    guest = GuestUser.find_by(email: params[:session][:email].downcase)
    guest_log_in(guest)
    flash[:success] = "Successfully Logged In."
  end

  def destroy_guest
    session[:guest_id] = nil
    guest_log_out if guest_logged_in?
    flash[:alert] = "Successfully Logged Out."
    redirect_to root_path
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Successfully Logged In."
      redirect_to user
    else
      flash[:danger] = "Invalid Email/Password Combination"
    redirect_to root_path
    end
  end


  def destroy
    session[:user_id] = nil
    log_out if logged_in?
    flash[:alert] = "Successfully Logged Out."
    redirect_to root_path
  end

end
