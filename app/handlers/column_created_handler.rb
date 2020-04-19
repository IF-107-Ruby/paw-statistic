class ColumnCreatedHandler < BasicEventHandler
  def execute!
    project = Project.update_or_create payload.project_column.project.to_hash
    Column.create payload.project_column.to_hash.merge(project: project)
  end
end
