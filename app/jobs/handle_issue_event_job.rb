class HandleIssueEventJob < BasicHandleEventJob
  private

  def handler_class(action)
    case action
    when 'opened' then IssueOpenedHandler
    when 'edited' then IssueEditedHandler
    when 'assigned' then IssueAssignedHandler
    when 'unassigned' then IssueUnassignedHandler
    when 'closed' then IssueClosedHandler
    when 'deleted' then IssueDeletedHandler
    else super; end
  end
end
