class IssueDeletedHandler < BasicEventHandler
  delegate :issue, to: :event

  def execute!
    Issue.destroy_by(github_id: issue.github_id)
  end
end
