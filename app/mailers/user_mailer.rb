class UserMailer < ApplicationMailer
  default from: 'no-reply@cody.works'

  def welcome_email(user)
    @user = user
    @url = 'http://blog.cody.works/login'
    mail(to: @user.email, subject: "Welcome to blog.cody.works!")
  end


end
