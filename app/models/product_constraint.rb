class ProductConstraint < Constraint
  def matches?(request)
    id = URI.unescape(request.path.gsub("/", ""))
    Product.find_by("lower(name) = ?", de_url(id))
  end
end
