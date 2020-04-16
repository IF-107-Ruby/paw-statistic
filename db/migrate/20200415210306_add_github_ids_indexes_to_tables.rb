class AddGithubIdsIndexesToTables < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :github_id, unique: true
    add_index :projects, :github_id, unique: true
    add_index :columns, :github_id, unique: true
    add_index :cards, :github_id, unique: true
    add_index :issues, :github_id, unique: true
  end
end
