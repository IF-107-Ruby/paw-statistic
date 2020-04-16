class HandleProjectEventJob < ApplicationJob
  include ::GithubJsonParser

  queue_as :default

  def perform(payload)
    @payload = payload
    case @payload[:action]
    when 'created'
      handle_project_created
    when 'edited'
      handle_project_updated
    when 'deleted'
      handle_project_deleted
    end
  end

  private

  def handle_project_updated
    Project.find_and_update(
      project_params_from_github_json(@payload[:project])
    )
  end

  def handle_project_created
    Project.find_or_create(
      project_params_from_github_json(@payload[:project])
      .merge(user: user_from_json(@payload[:sender]))
    )
  end

  def handle_project_deleted
    Project.find_by(github_id: @payload[:project][:id])&.destroy
  end
end
