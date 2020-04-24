class CardEditedHandler < BasicEventHandler
  def execute!
    Card.update_or_create event.project_card
  end
end
