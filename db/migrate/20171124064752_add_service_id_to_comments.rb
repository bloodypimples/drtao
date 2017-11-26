class AddServiceIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :service_id, :integer
  end
end
