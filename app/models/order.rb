class Order < ApplicationRecord
  has_many :line_items
  validates :line_items, :name, :email, :address, presence: true
end
