class AdminOrderNotifier < ActionMailer::Base
  default from: ENV['TEST_EMAIL']

  def received(order)
    @order = order

    if order.coupon_id
      @coupon = Coupon.find(order.coupon_id)
    end

    mail to: ENV['TEST_EMAIL'], subject: 'NEW order!'
  end

end