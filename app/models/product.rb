class Product < Searchable
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: "1300x1300>", medium: "600x600>", thumb: "100x100" }, default_url: "/assets/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :image
end
