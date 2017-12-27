class AddPhoneNumberToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :phone_number, :integer
  end
end
