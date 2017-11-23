module ApplicationHelper
  def gravatar_for(email = "user@example.org", option = { size: 64 })
    gravatar_id = Digest::MD5::hexdigest(email)
    size = option[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
    image_tag(gravatar_url, class: "gravatar media-object")
  end

  def get_comment_time(comment)
    comment.created_at.strftime("%b %e'%Y")
  end
end
