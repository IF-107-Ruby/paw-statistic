class CardEditedHandler < BasicEventHandler
  def execute!
    Card.update_or_create params.project_card
  end
end
