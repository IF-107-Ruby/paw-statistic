class CardMovedHandler < BasicEventHandler
  def execute!
    card = Card.find_by(github_id: params.project_card.github_id)
    to = Column.find_by(github_id: params.project_card.column_id)
    card.move({ to: to, moved_by: sender,
                moved_at: params.project_card.updated_on_github_at })
  end
end
