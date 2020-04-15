class CreateCardMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :card_moves do |t|
      t.integer :from_id
      t.integer :to_id
      t.references :user, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.datetime :moved_at

      t.timestamps
    end

    add_foreign_key :card_moves, :columns, column: :from_id
    add_foreign_key :card_moves, :columns, column: :to_id
  end
end
