class ApplicationController < ActionController::Base
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
end
