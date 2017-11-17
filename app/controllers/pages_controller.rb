class PagesController < ApplicationController
  def home
    @ep_kinh_iphone_products = get_products_from_category("Ép kính iPhone", 4)
    @sua_iphone_products = get_products_from_category("Sửa iPhone", 4)
    @iphone_moi_products = get_products_from_category("iPhone mới", 4)
    @iphone_cu_products = get_products_from_category("iPhone cũ", 4)
  end
end
