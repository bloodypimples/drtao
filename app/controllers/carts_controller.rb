class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def show
    @count = @cart.line_items.count
  end
end
