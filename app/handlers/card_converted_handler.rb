class CardConvertedHandler < BasicEventHandler
  def execute!
    issue = Issue.update_or_create payload
            .project_card.issue.to_hash.merge(user: sender)
    card = Card.find_by(github_id: payload.project_card.github_id)
    card.update(issue: issue)
  end
end
