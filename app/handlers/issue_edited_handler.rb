class IssueEditedHandler < BasicEventHandler
  def execute!
    Issue.update_or_create payload.issue.to_hash
  end
end
