class CreateSuperCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :super_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
