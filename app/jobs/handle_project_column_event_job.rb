class HandleProjectColumnEventJob < ApplicationJob
  queue_as :default

  def perform(payload)
    case payload['action']
    when 'created'
      handle_column_created payload
    when 'edited'
      handle_column_updated payload
    when 'deleted'
      handle_column_deleted payload
    end
  end

  private

  def handle_column_updated(data)
    col = GithubApi::Models::Column.new json: data['project_column']
    Column.find_by(column_id: col.column_id)&.update col.as_json
  end

  def handle_column_created(data)
    col = GithubApi::Models::Column.new json: data['project_column']
    col.cards
    proj = Project.find_by(project_id: col.project.project_id)
    Column.create col.as_json.merge(project: proj)
  end

  def handle_column_deleted(data)
    Column.find_by(column_id: data['project_column']['id'])&.destroy
  end
end
