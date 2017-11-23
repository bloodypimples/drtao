class ApplicationController < ActionController::Base
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

  def get_products_from_category(category_name, limit)
    Category.find_by(name: category_name).products.order("created_at desc").limit(limit)
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

  def get_price(price_int)
    number_with_precision(price_int, :precision => 0, :delimiter => ',').to_s + "₫"
  end

  helper_method :cp, :en_url, :de_url, :title, :get_price
end
