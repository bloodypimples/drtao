class Searchable < ApplicationRecord
  after_commit :compress

  has_attached_file :image, styles: { large: ["1300x1300>", :jpg], medium: ["600x600>", :jpg], thumb: ["100x100", :jpg] }, default_url: "/assets/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  self.abstract_class = true

  def self.search(name)
    where("name ILIKE ?", "%#{name}%")
  end

  def compress
    # system "convert #{self.image.path(:large)} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB #{self.image.path(:large)}"
    # system "convert #{self.image.path(:medium)} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB #{self.image.path(:medium)}"
    # system "convert #{self.image.path(:thumb)} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB #{self.image.path(:thumb)}"
    `echo 'backticks command successfully executed'`
  end
end
