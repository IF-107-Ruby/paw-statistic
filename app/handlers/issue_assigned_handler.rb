class IssueAssignedHandler < BasicEventHandler
  delegate :issue, :assignee, to: :event
  delegate :id, :column_id, to: :issue

  def execute!
    issue = Issue.find(id)
    issue.update(assignee: User.update_or_create(assignee))
  end
end
