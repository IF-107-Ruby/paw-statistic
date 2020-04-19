class ColumnEditedHandler < BasicEventHandler
  def execute!
    Column.find_and_update payload.project_column.to_hash
  end
end
