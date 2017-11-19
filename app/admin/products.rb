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

  form do |f|
    inputs 'Details' do
      input :name
      input :price
      input :category
      input :description, :as => :ckeditor
      input :image
    end
    actions
  end
end
