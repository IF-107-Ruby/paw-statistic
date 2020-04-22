class IssueOpenedHandler < BasicEventHandler
  def execute!
    Issue.create(params.issue.with_params(user: sender))
  end
end
