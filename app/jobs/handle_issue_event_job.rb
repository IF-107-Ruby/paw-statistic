class HandleIssueEventJob < ApplicationJob
  include HandleEventJob
  queue_as :default

  private

  def get_handler(action)
    case action
    when 'opened' then IssueOpenedHandler
    when 'edited' then IssueEditedHandler
    when 'assigned' then IssueAssignedHandler
    when 'unassigned' then IssueUnassignedHandler
    when 'deleted' then IssueDeletedHandler; end
  end
end
