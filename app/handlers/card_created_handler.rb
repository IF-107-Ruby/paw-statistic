class CardCreatedHandler < BasicEventHandler
  def execute!
    Card.create(params.project_card.with_params(user: sender, column: column))
  end

  def column
    Column.find_by(github_id: params.project_card.column_id)
  end
end
