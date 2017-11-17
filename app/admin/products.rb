ActiveAdmin.register Product do

  permit_params :name, :price, :description, :category_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description
    actions
  end

  form title: 'A custom title' do |f|
    inputs 'Details' do
      input :name
      input :price
      input :category
    end
    inputs 'Description', :description
    input :image
    actions
  end
end
