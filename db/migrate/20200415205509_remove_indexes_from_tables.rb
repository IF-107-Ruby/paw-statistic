class RemoveIndexesFromTables < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :user_id
    remove_index :projects, :project_id
    remove_index :columns, :column_id
    remove_index :cards, :card_id
    remove_index :issues, :issue_id
  end
end
