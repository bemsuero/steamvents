class UserMailer < ApplicationMailer


  def password_reset
    @greeting = "Hi ##{@user.first_name}"

    mail to: "to@example.org"
  end
end
