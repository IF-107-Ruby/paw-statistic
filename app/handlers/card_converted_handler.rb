class CardConvertedHandler < BasicEventHandler
  def execute!
    issue = Issue.update_or_create(params.project_card_issue.with_params(user: sender))
    card.update(issue: issue)
  end

  def card
    Card.find_by(github_id: params.project_card.github_id)
  end
end
