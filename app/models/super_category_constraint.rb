class SuperCategoryConstraint < Constraint
  def matches?(request)
    id = URI.unescape(request.path.gsub("/", ""))
    SuperCategory.find_by("lower(name) = ?", de_url(id))
  end
end
