class CardMovedHandler < BasicEventHandler
  def execute!
    card = Card.find_by(github_id: payload.project_card.github_id)
    to = Column.find_by(github_id: payload.project_card.column_id)
    card.move({ to: to, moved_by: sender,
                moved_at: payload.project_card.updated_on_github_at })
  end
end
