class AddUpdatedOnGithubAtTimestampToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :updated_on_github_at, :datetime
    add_column :projects, :updated_on_github_at, :datetime
    add_column :columns, :updated_on_github_at, :datetime
    add_column :cards, :updated_on_github_at, :datetime
    add_column :issues, :updated_on_github_at, :datetime
  end
end
