class ChangeOrderIdTypeToString < ActiveRecord::Migration[5.1]
  def up
   change_column :orders, :id, :string
  end

  def down
   change_column :orders, :id, :integer
  end
end
