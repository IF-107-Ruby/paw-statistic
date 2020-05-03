class RenameColumnUserItToTeamMemberId < ActiveRecord::Migration[6.0]
  def change
    %i[card_moves cards issues projects].each do |t|
      rename_column(t, :user_id, :team_member_id)
    end
  end
end
