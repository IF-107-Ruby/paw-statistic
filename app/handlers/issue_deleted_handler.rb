class IssueDeletedHandler < BasicEventHandler
  def execute!
    Issue.destroy_by(github_id: payload.issue.github_id)
  end
end
