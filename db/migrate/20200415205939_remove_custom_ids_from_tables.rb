class RemoveCustomIdsFromTables < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_id, :integer
    remove_column :projects, :project_id, :integer
    remove_column :columns, :column_id, :integer
    remove_column :cards, :card_id, :integer
    remove_column :issues, :issue_id, :integer
  end
end
