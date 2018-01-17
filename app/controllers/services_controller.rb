class ServicesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]
  before_action :set_service, only: [:show]

  def index
    @categories = Category.where(for: "Services")
    @per_page = 15

    if params[:'danh-mục'].blank?
      @title = "DỊCH VỤ"
      @count = Service.count
      @services = Service.paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
      @services_array = @services.in_groups_of(3)
    else
      @category_name = de_url(params[:'danh-mục'])
      @title = @category_name.mb_chars.upcase
      @category = Category.find_by("lower(name) = ?", @category_name)
      @category_id = @category.id
      @count = Service.where(category: @category_id).count
      @services = Service.where(category: @category_id).paginate(:page => params[:trang], :per_page => @per_page).order("created_at desc")
      @services_array = @services.in_groups_of(3)
    end
  end

  def show
  end

  private

  def set_service
    @service = Service.find_by("lower(name) = ?", de_url(params[:id]))
  end
end
