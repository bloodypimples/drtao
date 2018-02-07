class AddForToSuperCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :super_categories, :for, :string
  end
end
