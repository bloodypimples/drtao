class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :part, optional: true
  belongs_to :service, optional: true
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  def name
    if self.product_id
      self.product.name
    elsif self.service_id
      self.service.name
    elsif self.part_id
      self.part.name
    end
  end

  def price
    if self.product_id
      self.product.price
    elsif self.service_id
      self.service.price
    elsif self.part_id
      self.part.price
    end
  end

  def type
    if self.product_id
      'product'
    elsif self.service_id
      'service'
    elsif self.part_id
      'part'
    end
  end
end
