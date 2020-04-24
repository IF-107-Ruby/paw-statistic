class SetUsersPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :github_id
    remove_column :users, :github_id, :integer
  end
end
