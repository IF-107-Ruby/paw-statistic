class AddAssigneesReferencesToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :assignee_id, :integer
    add_foreign_key :issues, :users, column: :assignee_id
  end
end
