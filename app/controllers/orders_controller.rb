class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    @order = Order.new(order_params)
    @order.id = SecureRandom.uuid
    @order.line_items = @cart.line_items
    @cart.destroy

    if @order.save
      redirect_to order_path(@order)
    else
      flash[:danger] = "Vui lòng điền đầy đủ thông tin."
      redirect_to gio_hang_path
    end
  end

  def show
  end

  private

  def order_params
    params[:order].permit(:name, :email, :address)
  end
end
