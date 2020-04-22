class IssueAssignedHandler < BasicEventHandler
  def execute!
    issue = Issue.find_by(github_id: params.issue.github_id)
    assignee = User.update_or_create params.assignee
    issue.update(assignee: assignee)
  end
end
