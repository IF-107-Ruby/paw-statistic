class CardCreatedHandler < BasicEventHandler
  def execute!
    column = Column.find_by(github_id: payload.project_card.column_id)
    Card.create(payload.project_card.to_hash
      .merge(user: sender, column: column))
  end
end
