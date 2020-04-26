class IssueUnassignedHandler < BasicEventHandler
  def execute!
    issue = Issue.find(event.issue.id)
    issue.remove_assignee
  end
end
