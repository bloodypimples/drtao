class OrderMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.send_receipt.subject
  #
  def send_receipt(order)
    @order = order

    mail to: @order.email, subject: "Hóa đơn đặt hàng của bạn tại Dr.Táo"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.notify_staff.subject
  #
  def notify_staff(order)
    @order = order

    mail to: STAFF_EMAIL, subject: "Hóa đơn đặt hàng mới từ #{@customer_name}."
  end
end
