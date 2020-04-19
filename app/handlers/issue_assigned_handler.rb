class IssueAssignedHandler < BasicEventHandler
  def execute!
    issue = Issue.find_by(github_id: payload.issue.github_id)
    assignee = User.update_or_create payload.assignee.to_hash
    issue.update(assignee: assignee)
  end
end
