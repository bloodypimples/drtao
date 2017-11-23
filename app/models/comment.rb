class Comment < ApplicationRecord
  belongs_to :product
  validates :name, :email, :body, presence: true
  validates :email, format: /@/
end
