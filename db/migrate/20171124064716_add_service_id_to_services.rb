class AddServiceIdToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :service_id, :integer
  end
end
