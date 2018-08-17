class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.order_summary(Order.last)
  end
end