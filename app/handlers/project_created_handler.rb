class ProjectCreatedHandler < BasicEventHandler
  def execute!
    Project.find_or_create(payload.project.to_hash.merge(user: sender))
  end
end
