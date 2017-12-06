class PagesController < ApplicationController
  def home
    @ep_kinh_iphone_services = get_from_category("Ép Kính iPhone", 4, "services")
    @sua_iphone_services = get_from_category("Sửa iPhone", 4, "services")
    @iphone_moi_products = get_from_category("iPhone mới", 4, "products")
    @iphone_cu_products = get_from_category("iPhone cũ", 4, "products")
    @articles = Article.last(4)
  end
end
