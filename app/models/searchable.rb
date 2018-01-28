class Searchable < ApplicationRecord
  after_commit :compress_image

  has_attached_file :image, styles: { large: ["1300x1300>", :png], medium: ["600x600>", :png], thumb: ["100x100", :png] }, default_url: "/assets/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  self.abstract_class = true

  def self.search(name)
    where("name ILIKE ?", "%#{name}%")
  end

  def compress(image_path)
    # system "convert #{self.image.path(:large)} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB #{self.image.path(:large)}"
    # system "convert #{self.image.path(:medium)} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB #{self.image.path(:medium)}"
    # system "convert #{self.image.path(:thumb)} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB #{self.image.path(:thumb)}"
    image = MiniMagick::Image.open(image_path)
    image.strip()
    image.write image_path
  end

  def compress_image
    compress(self.image.path(:large))
    compress(self.image.path(:medium))
    compress(self.image.path(:thumb))
  end
end
