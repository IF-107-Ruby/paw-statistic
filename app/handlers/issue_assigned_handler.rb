class IssueAssignedHandler < BasicEventHandler
  def execute!
    issue = Issue.find_by(github_id: payload.issue.github_id)
    assignee = User.find_or_create payload.assignee
    issue.update(assignee: assignee)
  end
end
