class ServiceConstraint < Constraint
  def matches?(request)
    id = URI.unescape(request.path.gsub("/", ""))
    Service.find_by("lower(name) = ?", de_url(id))
  end
end
