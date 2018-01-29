class PartConstraint < Constraint
  def matches?(request)
    id = URI.unescape(request.path.gsub("/", ""))
    Part.find_by("lower(name) = ?", de_url(id))
  end
end
