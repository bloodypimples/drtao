class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :part, optional: true
  belongs_to :service, optional: true
  belongs_to :cart
end
