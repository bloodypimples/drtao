ActiveAdmin.register Article do
  permit_params :title, :description, :user_id, :body

  index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  form do |f|
    inputs 'Details' do
      input :title
      input :description
      input :body, :as => :ckeditor
      input :image
    end
    actions
  end
end
