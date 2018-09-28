class UserMailer < ApplicationMailer


  def password_reset
    @greeting = "Hi ##{@user.first_name}"
    @user = user
    mail to: user.email, subject: "Password Reset"

  end
end
