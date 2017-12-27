class Order < ApplicationRecord
  has_many :line_items
  validates :line_items, :name, :email, :address, presence: true

  def total_price
    total_price = 0

    self.line_items.each do |item|
      total_price += item.price
    end

    total_price
  end
end
