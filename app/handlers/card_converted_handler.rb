class CardConvertedHandler < BasicEventHandler
  def execute!
    issue = Issue.update_or_create(params)
                 .project_card.issue.with_parms(user: sender)
    card = Card.find_by(github_id: params.project_card.github_id)
    card.update(issue: issue)
  end
end
