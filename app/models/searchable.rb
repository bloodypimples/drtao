class Searchable < ApplicationRecord
  after_commit :compress_image, on: [:create, :update]

  has_attached_file :image, styles: { large: ["1300x1300>", :jpg], medium: ["250x250>", :jpg], thumb: ["100x100", :jpg] }, default_url: "/assets/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  self.abstract_class = true

  def self.search(name)
    where("name ILIKE ?", "%#{name}%")
  end

  def compress(image_path)
    system "convert #{image_path} -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB #{image_path}"
    # image = MiniMagick::Image.open(image_path)
    # image.strip()
    # image.write image_path
  end

  def compress_image
    compress(self.image.path(:large))
    compress(self.image.path(:medium))
    compress(self.image.path(:thumb))
  end
end
