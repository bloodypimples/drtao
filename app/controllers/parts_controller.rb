class PartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]
  before_action :set_product, only: [:show]

  def index
    @categories = Category.where(for: "Parts")
    @per_page = 15

    if params[:'danh-mục'].blank?
      @title = "LINH KIỆN"
      @count = Part.count
      @parts = Part.paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
      @parts_array = @parts.in_groups_of(3)
    else
      @category_name = de_url(params[:'danh-mục'])
      @title = @category_name.mb_chars.upcase
      @category = Category.find_by("lower(name) = ?", @category_name)
      @category_id = @category.id
      @count = Part.where(category: @category_id).count
      @parts = Part.where(category: @category_id).paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
      @parts_array = @parts.in_groups_of(3)
    end
  end

  def show
  end

  private

  def set_product
    @part = Part.find_by("lower(name) = ?", de_url(params[:id]))
  end
end
