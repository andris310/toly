class OrderNotifier < ActionMailer::Base
  default from: ENV['TEST_EMAIL']

  def received(order)
    @order = order
    if order.user_id
      @url = user_url(order.user_id)
    end

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
