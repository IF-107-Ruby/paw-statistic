class ProjectEditedHandler < BasicEventHandler
  def execute!
    Project.update_or_create payload.project.to_hash
  end
end
