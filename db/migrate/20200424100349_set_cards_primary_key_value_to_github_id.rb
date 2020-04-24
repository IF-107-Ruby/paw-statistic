class SetCardsPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  def change
    remove_index :cards, :github_id
    remove_column :cards, :github_id, :integer
  end
end
