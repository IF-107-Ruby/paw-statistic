class IssueUnassignedHandler < BasicEventHandler
  def execute!
    issue = Issue.find(event.issue.id)
    issue.update(assignee: nil)
  end
end
