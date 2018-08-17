class UserMailer < ApplicationMailer
  default from: 'jungle@lighthouse.ca'
 
  def welcome_email
    @user = "paul.c.lo@gmail.com"
    @url  = 'https://mail.google.com/mail/u/0/#inbox'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
