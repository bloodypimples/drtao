class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]
  before_action :set_product, only: [:show]

  def index
    @categories = Category.where(for: "Products")
    @per_page = 15

    if params[:'danh-mục'].blank?
      @title = "SẢN PHẨM"
      @count = Product.count
      @products = Product.paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
      @products_array = @products.in_groups_of(3)
    else
      @category_name = de_url(params[:'danh-mục'])
      @title = @category_name.mb_chars.upcase
      @category = Category.find_by("lower(name) = ?", @category_name)
      @category_id = @category.id
      @count = Product.where(category: @category_id).count
      @products = Product.where(category: @category_id).paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
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
