class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.integer :product_id

      t.timestamps
    end
  end
end
