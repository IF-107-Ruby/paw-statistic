class HandleProjectColumnEventJob < ApplicationJob
  include ::GithubJsonParser

  queue_as :default

  def perform(payload)
    @payload = payload
    case @payload[:action]
    when 'created'
      handle_column_created
    when 'edited'
      handle_column_updated
    when 'deleted'
      handle_column_deleted
    end
  end

  private

  def handle_column_updated
    Column.find_and_update(column_params_from_github_json(@payload[:project_column]))
  end

  def handle_column_created
    project = Project.find_or_create project_params_from_github_json(
      GithubApi.get(
        endpoint: @payload[:project_column][:project_url]
      )
    )
    Column.create column_params_from_github_json(
      @payload[:project_column]
    ).merge(project: project)
  end

  def handle_column_deleted
    Column.find_by(github_id: @payload[:project_column][:id])&.destroy
  end
end
