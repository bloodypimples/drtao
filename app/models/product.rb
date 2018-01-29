class Product < Searchable
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :line_items, dependent: :destroy
end
