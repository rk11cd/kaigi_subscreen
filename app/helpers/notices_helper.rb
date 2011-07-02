module NoticesHelper
  def link_to_action(notice)
    case notice.status
    when "draft"
      link_to "Publish", publish_notice_path(notice)
    when "published"
      link_to "Close", close_notice_path(notice)
    when "closed"
      link_to "Reopen", publish_notice_path(notice)
    end
  end
end
