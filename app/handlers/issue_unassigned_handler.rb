class IssueUnassignedHandler < BasicEventHandler
  def execute!
    issue = Issue.find_by(github_id: params.issue.github_id)
    issue.update(assignee: nil)
  end
end
