class IssueEditedHandler < BasicEventHandler
  def execute!
    Issue.find_and_update payload.issue.to_hash
  end
end
