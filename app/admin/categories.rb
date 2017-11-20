ActiveAdmin.register Category do
  permit_params :name, :for

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
      input :for
    end
    actions
  end
end
