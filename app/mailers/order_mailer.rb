class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def order_summary(order)
    mail(to: order.email, subject: order.id)
  end
end