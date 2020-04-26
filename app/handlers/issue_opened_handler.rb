class IssueOpenedHandler < BasicEventHandler
  delegate :issue, to: :event

  def execute!
    Issue.create(issue.with_params(user: sender))
  end
end
