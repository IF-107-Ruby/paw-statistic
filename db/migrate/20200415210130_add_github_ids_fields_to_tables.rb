class AddGithubIdsFieldsToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :github_id, :integer
    add_column :projects, :github_id, :integer
    add_column :columns, :github_id, :integer
    add_column :cards, :github_id, :integer
    add_column :issues, :github_id, :integer
  end
end
