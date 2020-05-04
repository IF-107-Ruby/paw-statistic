class RemoveColumnsFromTeamMembers < ActiveRecord::Migration[6.0]
  def up
    columns = %i[email encrypted_password reset_password_token
                 reset_password_sent_at remember_created_at sign_in_count
                 current_sign_in_at last_sign_in_at current_sign_in_ip
                 last_sign_in_ip uid provider]
    columns.each do |c|
      remove_column :team_members, c
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
