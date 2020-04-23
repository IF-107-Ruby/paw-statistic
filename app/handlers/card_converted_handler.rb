class CardConvertedHandler < BasicEventHandler
  delegate :project_card, to: :params
  delegate :issue, :github_id, to: :project_card

  def execute!
    issue = Issue.update_or_create(issue.with_params(user: sender))
    card.update(issue: issue)
  end

  def card
    Card.find_by(github_id: github_id)
  end
end
