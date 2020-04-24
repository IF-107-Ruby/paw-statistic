class CardDeletedHandler < BasicEventHandler
  delegate :project_card, to: :event

  def execute!
    Card.destroy_by(id: project_card.id)
  end
end
