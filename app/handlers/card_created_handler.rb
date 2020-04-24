class CardCreatedHandler < BasicEventHandler
  delegate :project_card, to: :event
  delegate :column_id, to: :project_card

  def execute!
    Card.create(project_card.with_params(user: sender, column: column))
  end

  def column
    Column.find(column_id)
  end
end
