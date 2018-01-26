ActiveAdmin.register Image do
  permit_params :image

  show do
    attributes_table do
     row :created_at
     row :updated_at
     row :image do |ad|
       image_tag ad.image.url(:thumb)
     end
     row 'Original size' do |image|
       link_to image.image.url, image.image.url
     end
     row '< 1300px' do |image|
       link_to image.image.url(:large), image.image.url(:large)
     end
     row '< 600px' do |image|
       link_to image.image.url(:medium), image.image.url(:medium)
     end
     row '100x100px' do |image|
       link_to image.image.url(:thumb), image.image.url(:thumb)
     end
   end
  end

  index do
    selectable_column
    column "Image" do |ad|
      image_tag ad.image.url(:thumb)
    end
    column "URL" do |image|
      link_to image.image.url, image.image.url
    end
    actions
  end

  form title: 'New image' do |f|
    input :image
    actions
  end

  action_item :new, only: :show do
    link_to 'New Image', new_admin_image_path
  end
end
