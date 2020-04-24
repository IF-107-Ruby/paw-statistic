class SetIssuesPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  def change
    remove_index :issues, :github_id
    remove_column :issues, :github_id, :integer
  end
end
