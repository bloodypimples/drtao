class ApplicationController < ActionController::Base
  before_action :set_layout_vars
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::NumberHelper

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_signin!
    if current_user.nil?
      redirect_to signin_path, alert: "You need to sign in or sign up before continuing."
    end
  end
  helper_method :require_signin!

  def get_from_category(category_name, limit, thing)
    @category = Category.find_by(name: category_name)

    if thing == "products"
      @products = Product.where(category_id: @category).order("created_at desc").limit(limit)
    elsif thing == "services"
      @services = Service.where(category_id: @category).order("created_at desc").limit(limit)
    elsif thing == "parts"
      @parts = Part.where(category_id: @category).order("created_at desc").limit(limit)
    end
  end

  def cp(path)
    "active" if current_page?(path)
  end

  def en_url(string)
    string.mb_chars.downcase.to_s.tr(" ", "-")
  end

  def de_url(string)
    string.tr("-", " ")
  end

  def title(string = '')
    if string.length > 0
      string + " - HỆ THỐNG SỬA IPHONE DR.TÁO"
    else
      "HỆ THỐNG SỬA IPHONE DR.TÁO"
    end
  end

  def is_added_to_cart?(thing_type, thing_id, cart)
    if thing_type == 'product'
      @item = cart.line_items.find_by(product_id: thing_id)
    elsif thing_type == 'service'
      @item = cart.line_items.find_by(service_id: thing_id)
    elsif thing_type == 'part'
      @item = cart.line_items.find_by(part_id: thing_id)
    end
  end

  helper_method :cp, :en_url, :de_url, :title, :is_added_to_cart?

  def set_layout_vars
    @sanpham_sub_categories = Category.where(for: "Products")
    @dichvu_sub_categories = Category.where(for: "Services")
    @linhkien_sub_categories = Category.where(for: "Parts")
  end

end
