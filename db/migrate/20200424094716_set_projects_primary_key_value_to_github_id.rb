class SetProjectsPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  def change
    remove_index :projects, :github_id
    remove_column :projects, :github_id, :integer
  end
end
