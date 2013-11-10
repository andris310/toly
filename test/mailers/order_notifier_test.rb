require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "TOLY Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal "TEST andris310@gmail.com", mail.from
    assert_match /1 x ebook of Stretches/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "TOLY Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal "TEST andris310@gmail.com", mail.from
    assert_match /<td>1&times;<\/td>\s*<td>ebook of Stretches<\/td>/, mail.body.encoded
  end

end
