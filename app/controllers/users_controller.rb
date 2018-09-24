class UsersController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'httparty'

  def new
    if logged_in?
      redirect_to @user
    else
    @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      p @user.errors.messages
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def contact
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
  end

end
