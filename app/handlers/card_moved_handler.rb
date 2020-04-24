class CardMovedHandler < BasicEventHandler
  delegate :project_card, to: :event
  delegate :github_id, :column_id, :updated_on_github_at, to: :project_card

  def execute!
    to = Column.find_by(github_id: column_id)
    card.move({ to: to, moved_by: sender, moved_at: updated_on_github_at })
  end

  def card
    Card.find_by(github_id: github_id)
  end
end
