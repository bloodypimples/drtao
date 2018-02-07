class SuperCategoriesController < ApplicationController
  def show
    @per_page = 15
    @super_category = SuperCategory.find_by("lower(name) = ?", de_url(params[:id]))
    @title = @super_category.name
    @categories = @super_category.categories
    @products = []
    @categories.each do |category|
      @products += Product.where(category: category.id).order("created_at desc")
    end
    @products_array = @products.in_groups_of(3)
    @count = @products.count
  end
end
