class ChangeLineItemsOrderIdType < ActiveRecord::Migration[5.1]
  def up
   change_column :line_items, :order_id, :string
  end

  def down
   change_column :line_items, :order_id, :integer
  end
end
