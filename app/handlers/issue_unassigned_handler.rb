class IssueUnassignedHandler < BasicEventHandler
  delegate :issue, to: :event

  def execute!
    issue = Issue.find_by(github_id: issue.github_id)
    issue.update(assignee: nil)
  end
end
