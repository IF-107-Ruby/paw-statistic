class ProjectDeletedHandler < BasicEventHandler
  def execute!
    Project.destroy_by(github_id: payload.project.github_id)
  end
end
