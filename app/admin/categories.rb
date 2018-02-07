ActiveAdmin.register Category do
  permit_params :name, :for, :super_category_id

  index do
    selectable_column
    id_column
    column :name
    column :for
    actions
  end

  form do |f|
    inputs 'Details' do
      input :name
      input :super_category
    end
    actions
  end
end
