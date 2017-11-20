class AddForToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :for, :string
  end
end
