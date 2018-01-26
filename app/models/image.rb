class Image < ApplicationRecord
  has_attached_file :image, styles: { large: "1300x1300>", medium: "600x600>", thumb: "100x100" }, default_url: "/assets/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
