class RemoveLineItemIdFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :line_item_id, :bigint
  end
end
