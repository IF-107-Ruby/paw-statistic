class IssueOpenedHandler < BasicEventHandler
  delegate :issue, to: :params

  def execute!
    Issue.create(issue.with_params(user: sender))
  end
end
