class Searchable < ApplicationRecord
  after_save :compress

  has_attached_file :image, styles: { large: ["1300x1300>", :png], medium: ["600x600>", :png], thumb: ["100x100", :png] }, default_url: "/assets/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  self.abstract_class = true

  def self.search(name)
    where("name ILIKE ?", "%#{name}%")
  end

  def compress
    system "convert #{self.image.path(:original)} -strip #{self.image.path(:original)}"
    system "convert #{self.image.path(:large)} -strip #{self.image.path(:large)}"
    system "convert #{self.image.path(:medium)} -strip #{self.image.path(:medium)}"
    system "convert #{self.image.path(:thumb)} -strip #{self.image.path(:thumb)}"
  end
end
