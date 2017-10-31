module RepliesHelper
  def last_reply(reply, replies)
    unless replies.last == reply
      '<hr>'.html_safe
    else
      ''
    end
  end
end
