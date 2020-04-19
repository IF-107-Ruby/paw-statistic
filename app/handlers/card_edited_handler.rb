class CardEditedHandler < BasicEventHandler
  def execute!
    Card.update_or_create payload.project_card.to_hash
  end
end
