class ColumnEditedHandler < BasicEventHandler
  def execute!
    Column.update_or_create payload.project_column.to_hash
  end
end
