class AddSuperCategoryIdToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :super_category_id, :integer
  end
end
