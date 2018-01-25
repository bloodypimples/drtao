class Service < Searchable
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: "1300x1300>", medium: "600x600>", thumb: "100x100" }, default_url: "/assets/default.png"
end
