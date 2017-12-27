class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    @order = Order.new(order_params)
    @order.id = SecureRandom.uuid
    @order.line_items = @cart.line_items

    if @order.save
      @cart.destroy
      OrderMailer.send_receipt(@order).deliver
      OrderMailer.notify_staff(@order).deliver
      flash[:success] = "Đặt hàng thành công, Dr.Táo sẽ liên lạc lại sớm nhất có thể."
      redirect_to order_path(@order)
    else
      flash[:danger] = "Vui lòng điền đầy đủ thông tin."
      redirect_to gio_hang_path
    end
  end

  def show
    @order = Order.find(params[:id])
    @count = @order.line_items.count
  end

  private

  def order_params
    params[:order].permit(:name, :email, :address, :phone_number)
  end
end
