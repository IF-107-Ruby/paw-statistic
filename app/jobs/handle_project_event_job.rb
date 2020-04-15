class HandleProjectEventJob < ApplicationJob
  queue_as :default

  def perform(payload)
    case payload['action']
    when 'created'
      handle_project_created payload
    when 'edited'
      handle_project_updated payload
    when 'deleted'
      handle_project_deleted payload
    end
  end

  private

  def handle_project_updated(data)
    proj = GithubApi::Models::Project.new json: data['project']
    Project.find_by(project_id: proj.project_id)&.update proj.as_json
  end

  def handle_project_created(data)
    proj = GithubApi::Models::Project.new json: data['project']
    user = User.create proj.creator.as_json
    Project.create proj.as_json.merge(user: user)
  end

  def handle_project_deleted(data)
    Project.find_by(project_id: data['project']['id'])&.destroy
  end
end
