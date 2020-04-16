class HandleProjectCardEventJob < ApplicationJob
  include ::GithubJsonParser

  queue_as :default

  def perform(payload)
    @payload = payload
    case @payload[:action]
    when 'created' then handle_card_created
    when 'edited' then handle_card_updated
    when 'converted' then handle_card_converted
    when 'moved' then handle_card_moved
    when 'deleted' then handle_card_deleted; end
  end

  private

  def handle_card_updated
    Card.find_and_update card_params_from_github_json(@payload[:project_card])
  end

  def handle_card_created
    column = Column.find_by(github_id: @payload[:project_card][:column_id])
    Card.create(
      card_params_from_github_json(@payload[:project_card])
      .merge(user: user_from_json(@payload[:sender]), column: column)
    )
  end

  def handle_card_deleted
    Card.find_by(github_id: @payload[:project_card][:id])&.destroy
  end

  def handle_card_converted
    issue = Issue.create issue_params_from_github_json(
      GithubApi.get(endpoint: @payload[:project_card][:content_url])
    ).merge(user: user_from_json(@payload[:sender]))
    Card.find_and_update(github_id: @payload[:project_card][:id], issue: issue)
  end

  def handle_card_moved
    Card.find_by(github_id: @payload[:project_card][:id])
        .move({ to: Column.find_by(github_id: @payload[:project_card][:column_id]),
                from: Column.find_by(github_id: @payload[:changes][:column_id][:from]),
                moved_by: user_from_json(@payload[:sender]),
                moved_at: @payload[:project_card][:updated_at] })
  end
end
