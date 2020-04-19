class ProjectEditedHandler < BasicEventHandler
  def execute!
    Project.find_and_update payload.project.to_hash
  end
end
