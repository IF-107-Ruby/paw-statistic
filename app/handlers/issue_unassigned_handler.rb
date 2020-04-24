class IssueUnassignedHandler < BasicEventHandler
  delegate :issue, to: :event

  def execute!
    issue = Issue.find(issue.id)
    issue.update(assignee: nil)
  end
end
