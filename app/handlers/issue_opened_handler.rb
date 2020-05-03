class IssueOpenedHandler < BasicEventHandler
  delegate :issue, to: :event

  def execute!
    Issue.create(issue.with_params(team_member: sender))
  end
end
