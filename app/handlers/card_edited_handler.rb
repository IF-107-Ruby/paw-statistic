class CardEditedHandler < BasicEventHandler
  def execute!
    Card.find_and_update payload.project_card.to_hash
  end
end
