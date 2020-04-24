class CardConvertedHandler < BasicEventHandler
  delegate :project_card, to: :event
  delegate :issue, :id, to: :project_card

  def execute!
    issue = Issue.update_or_create(issue.with_params(user: sender))
    card.update(issue: issue)
  end

  def card
    Card.find(id)
  end
end
