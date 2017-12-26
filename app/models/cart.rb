class Cart < ApplicationRecord
  include ActionView::Helpers
  has_many :line_items, dependent: :nullify

  def total_price
    total_price = 0

    self.line_items.each do |item|
      total_price += item.price
    end

    total_price
  end
end
