class Product < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100" }, default_url: "/assets/default.gif"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
