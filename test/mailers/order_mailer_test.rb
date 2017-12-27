require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "send_receipt" do
    mail = OrderMailer.send_receipt
    assert_equal "Send receipt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_staff" do
    mail = OrderMailer.notify_staff
    assert_equal "Notify staff", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
