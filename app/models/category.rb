class Category < ApplicationRecord
  belongs_to :super_category
  before_save :set_for, on: [:create]

  def set_for
    self.for = self.super_category.for
  end
end
