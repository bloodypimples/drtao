class AddPartIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :part_id, :integer
  end
end
