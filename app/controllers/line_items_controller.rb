class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]

  def create
    @line_item = @cart.line_items.new
    if params[:thing_type] == 'product'
      @product = Product.find_by("lower(name) = ?", de_url(params[:thing_id]))
      @line_item.product = @product
    elsif params[:thing_type] == 'service'
      @service = Service.find_by("lower(name) = ?", de_url(params[:thing_id]))
      @line_item.service = @service
    elsif params[:thing_type] == 'part'
      @part = Part.find_by("lower(name) = ?", de_url(params[:thing_id]))
      @line_item.part = @part
    end

    if @line_item.save
      redirect_to request.referer
    end
  end

  def destroy
    if params[:thing_type] == 'product'
      @line_item = @cart.line_items.find_by(product_id: params[:thing_id])
    elsif params[:thing_type] == 'service'
      @line_item = @cart.line_items.find_by(service_id: params[:thing_id])
    elsif params[:thing_type] == 'part'
      @line_item = @cart.line_items.find_by(part_id: params[:thing_id])
    end

    @line_item.destroy
    redirect_to request.referer
  end
end
