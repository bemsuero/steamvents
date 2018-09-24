class UsersController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'

  def new
    @guest_user = GuestUser.new

    if logged_in?
      redirect_to @user
    else
    @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      p @user.errors.messages
      render "new"
    end
  end

  def create_guest_users
    @guest_user = GuestUser.new(guest_user_params)
    if @guest_user.save
      guest_log_in(@guest_user)
      redirect_to new_post_path
    end
  end

  def edit
  end

  def show
    @post = Post.new
    @posts = Post.all
  end

  def contact
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end
  def guest_user_params
    params.require(:guest_user).permit(:name, :email)
  end

end
