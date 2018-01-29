class NewsConstraint < Constraint
  def matches?(request)
    id = URI.unescape(request.path.gsub("/", ""))
    Article.find_by("lower(title) = ?", de_url(id))
  end
end
