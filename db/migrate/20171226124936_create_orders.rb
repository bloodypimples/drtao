class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :line_item, foreign_key: true
      t.string :email
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
