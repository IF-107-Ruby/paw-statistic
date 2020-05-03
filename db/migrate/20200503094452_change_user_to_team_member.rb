class ChangeUserToTeamMember < ActiveRecord::Migration[6.0]
  def change
    rename_table :users, :team_members
  end
end
