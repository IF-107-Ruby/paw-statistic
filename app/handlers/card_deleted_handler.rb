class CardDeletedHandler < BasicEventHandler
  def execute!
    Card.destroy_by(github_id: payload.project_card.github_id)
  end
end
