class CardDeletedHandler < BasicEventHandler
  delegate :project_card, to: :params

  def execute!
    Card.destroy_by(github_id: project_card.github_id)
  end
end
