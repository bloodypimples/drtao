class PagesController < ApplicationController
  def home
    @ep_kinh_iphone_services = get_from_category("Ép Kính iPhone", 4, "services")
    @sua_iphone_services = get_from_category("Sửa iPhone", 4, "services")
    @iphone_moi_products = get_from_category("iPhone mới", 4, "products")
    @iphone_cu_products = get_from_category("iPhone cũ", 4, "products")
    @articles = Article.all.order("created_at desc").limit(4)
  end

  def search
    @term = params[:search].strip if params[:search]
    if @term.present? && !@term.empty?
      @products = Product.search(@term)
      @services = Service.search(@term)
      @parts = Part.search(@term)
      @products_array = Product.search(@term).in_groups_of(4)
      @services_array = Service.search(@term).in_groups_of(4)
      @parts_array = Part.search(@term).in_groups_of(4)
      @total = @products + @services + @parts
    else
      # initialize total to a empty hash if query is empty
      @total = {}
    end
  end
end
