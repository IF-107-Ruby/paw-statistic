class IssueEditedHandler < BasicEventHandler
  def execute!
    Issue.update_or_create params.issue
  end
end
