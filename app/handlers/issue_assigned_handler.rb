class IssueAssignedHandler < BasicEventHandler
  delegate :issue, :assignee, to: :params
  delegate :github_id, :column_id, to: :issue

  def execute!
    issue = Issue.find_by(github_id: github_id)
    issue.update(assignee: User.update_or_create(assignee))
  end
end
