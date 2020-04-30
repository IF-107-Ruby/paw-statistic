class IssueDeletedHandler < BasicEventHandler
  delegate :issue, to: :event

  def execute!
    Issue.destroy_by(id: issue.id)
  end
end
