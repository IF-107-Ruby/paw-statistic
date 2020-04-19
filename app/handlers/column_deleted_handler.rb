class ColumnDeletedHandler < BasicEventHandler
  def execute!
    Column.destroy_by(github_id: payload.project_column.github_id)
  end
end
