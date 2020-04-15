class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :login

      t.timestamps
    end

    add_index :users, :login
    add_index :users, :user_id
  end
end
