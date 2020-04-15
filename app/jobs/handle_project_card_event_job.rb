class HandleProjectCardEventJob < ApplicationJob
  queue_as :default

  def perform(payload)
    case payload['action']
    when 'created' then handle_card_created payload
    when 'edited' then handle_card_updated payload
    when 'converted' then handle_card_converted payload
    when 'moved' then handle_card_moved payload
    when 'deleted' then handle_card_deleted payload; end
  end

  private

  def handle_card_updated(data)
    card = GithubApi::Models::Card.new json: data['project_card']
    Card.find_by(card_id: card.card_id)&.update card.as_json
  end

  def handle_card_created(data)
    card = GithubApi::Models::Card.new json: data['project_card']
    column = Column.find_by(column_id: data['project_card']['column_id'])
    user = User.create card.creator.as_json
    Card.create! card.as_json.merge(user: user, column: column)
  end

  def handle_card_deleted(data)
    Card.find_by(card_id: data['project_card']['id'])&.destroy
  end

  def handle_card_converted(data)
    card = GithubApi::Models::Card.new json: data['project_card']
    user = User.create card.content.user.as_json
    issue = Issue.create card.content.as_json.merge(user: user)
    Card.find_by(card_id: card.card_id).update(issue: issue)
  end

  def handle_card_moved(data)
    Card.find_by(card_id: data['project_card']['id'])
        .move({ to: Column.find_by(column_id: data['project_card']['column_id']),
                from: Column.find_by(column_id: data['changes']['column_id']['from']),
                moved_by: User.create_from_github_event(data['sender']),
                moved_at: data['project_card']['updated_at'] })
  end
end
