class ProjectCreatedHandler < BasicEventHandler
  def execute!
    Project.update_or_create(payload.project.to_hash.merge(user: sender))
  end
end
