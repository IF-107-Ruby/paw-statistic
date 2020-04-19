class IssueUnassignedHandler < BasicEventHandler
  def execute!
    issue = Issue.find_by(github_id: payload.issue.github_id)
    issue.update(assignee: nil)
  end
end
