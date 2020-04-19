class IssueOpenedHandler < BasicEventHandler
  def execute!
    Issue.create(payload.issue.to_hash.merge(user: sender))
  end
end
