class Searchable < ApplicationRecord
  self.abstract_class = true

  def self.search(name)
    where("name ILIKE ?", "%#{name}%")
  end
end
