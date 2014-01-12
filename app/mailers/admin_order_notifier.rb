class AdminOrderNotifier < ActionMailer::Base
  default from: "TEST andris310@gmail.com"

  def received(order)
    @order = order

    mail to: ENV['TEST_EMAIL'], subject: 'NEW order!'
  end

end