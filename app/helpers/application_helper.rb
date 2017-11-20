module ApplicationHelper
  def cp(path)
    "active" if current_page?(path)
  end

  def urlify(string)
    string.mb_chars.downcase.to_s.tr(" ", "-")
  end
end
