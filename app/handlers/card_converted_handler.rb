class CardConvertedHandler < BasicEventHandler
  delegate :project_card, to: :event
  delegate :id, to: :project_card

  def execute!
    issue = Issue.update_or_create(project_card.issue.with_params(user: sender))
    card.update(issue: issue)
  end

  def card
    Card.find(id)
  end
end
