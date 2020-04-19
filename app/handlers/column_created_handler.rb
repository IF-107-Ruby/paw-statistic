class ColumnCreatedHandler < BasicEventHandler
  def execute!
    project = Project.find_or_create payload.project_column.project
    Column.create payload.project_column.to_hash.merge(project: project)
  end
end
