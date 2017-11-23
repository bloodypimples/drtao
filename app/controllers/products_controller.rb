class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @categories = Category.where(for: "Products")

    if params[:'danh-mục'].blank?
      @products = Product.paginate(:page => params[:trang], :per_page => 15).order("created_at desc")
      @products_array = @products.in_groups_of(3)
    else
      @category_name = de_url(params[:'danh-mục'])
      @category = Category.find_by("lower(name) = ?", @category_name)
      @category_id = @category.id
      @products = Product.where(category: @category_id).paginate(:page => params[:trang], :per_page => 15).order("created_at desc")
      @products_array = @products.in_groups_of(3)
    end
  end

  def show
  end

  private

  def set_product
    @product = Product.find_by("lower(name) = ?", de_url(params[:id]))
  end
end
