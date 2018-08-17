class UserMailer < ApplicationMailer
  default from: 'jungle@lighthouse.ca'
 
  def order_summary(order)
    @user = order.email
    @order =order
    mail(to: @user, subject: @order.id)
  end
end
