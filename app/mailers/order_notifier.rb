class OrderNotifier < ActionMailer::Base
  default from: "TEST andris310@gmail.com"

  def received(order)
    @order = order

    mail to: order.email, subject: 'TOLY Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'TOLY Store Order Shipped'
  end
end
