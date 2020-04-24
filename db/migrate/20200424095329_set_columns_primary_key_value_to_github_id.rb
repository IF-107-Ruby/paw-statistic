class SetColumnsPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  def change
    remove_index :columns, :github_id
    remove_column :columns, :github_id, :integer
  end
end
