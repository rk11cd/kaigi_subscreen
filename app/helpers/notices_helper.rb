module NoticesHelper
  def link_to_action(notice)
    case notice.status
    when "draft"
      link_to "Publish", publish_notice_path(notice), :method => :put
    when "published"
      link_to "Close", close_notice_path(notice), :method => :put
    when "closed"
      link_to "Reopen", publish_notice_path(notice), :method => :put
    end
  end
end
