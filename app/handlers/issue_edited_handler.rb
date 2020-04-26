class IssueEditedHandler < BasicEventHandler
  def execute!
    Issue.update_or_create(event.issue)
  end
end
