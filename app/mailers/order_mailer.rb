class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'
  layout 'mailer'

  def order_email(order)
    @order = order
    @email = order.email
    mail(to: @email, subject: "Your Jungle.com Order: #{@order.id}")
  end

end

