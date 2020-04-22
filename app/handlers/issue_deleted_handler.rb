class IssueDeletedHandler < BasicEventHandler
  def execute!
    Issue.destroy_by(github_id: params.issue.github_id)
  end
end
