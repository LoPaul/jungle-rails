class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def order_summary(order)
    puts mail(to: order.email, subject: order.id)
  end
end