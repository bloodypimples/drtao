class Comment < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :product, optional: true
  belongs_to :service, optional: true
  belongs_to :part, optional: true
  validates :name, :email, :body, presence: true
  validates :email, format: /@/
end
