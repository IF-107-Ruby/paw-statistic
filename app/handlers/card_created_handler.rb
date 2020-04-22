class CardCreatedHandler < BasicEventHandler
  def execute!
    column = Column.find_by(github_id: params.project_card.column_id)
    Card.create(params.project_card.with_params(user: sender, column: column))
  end
end
