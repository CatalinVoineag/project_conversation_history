class CommentDecorator < SimpleDelegator
  def timeline_message
    "#{user.email} commented #{body}"
  end
end
