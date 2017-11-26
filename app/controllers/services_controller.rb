class ServicesController < ApplicationController
  before_action :set_service, only: [:show]

  def index
    @categories = Category.where(for: "Services")

    if params[:'danh-mục'].blank?
      @services = Service.paginate(:page => params[:trang], :per_page => 15).order("created_at desc")
      @services_array = @services.in_groups_of(3)
    else
      @category_name = de_url(params[:'danh-mục'])
      @category = Category.find_by("lower(name) = ?", @category_name)
      @category_id = @category.id
      @services = Service.where(category: @category_id).paginate(:page => params[:trang], :per_page => 15).order("created_at desc")
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
