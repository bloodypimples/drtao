ActiveAdmin.register Order do
  # permit_params :name, :price, :description, :category_id, :image, :body

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :email
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :address
    end
    panel "Sản phẩm" do
      table_for order.line_items do
        column :name
        column :price
      end
    end
  end
end
