class AddNextMoveReferencesToCardMoves < ActiveRecord::Migration[6.0]
  def change
    add_column :card_moves, :next_move_id, :integer
    add_foreign_key :card_moves, :card_moves, column: :next_move_id
  end
end
