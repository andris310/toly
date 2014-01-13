class AdminOrderNotifier < ActionMailer::Base
  default from: "TEST andris310@gmail.com"

  def received(order)
    @order = order
    @coupon = Coupon.find(order.coupon_id)
    mail to: ENV['TEST_EMAIL'], subject: 'NEW order!'
  end

end