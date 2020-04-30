class RemoveLastMoveReferencesFromCards < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :cards, :card_moves, column: :last_move_id
    remove_column :cards, :last_move_id, :integer
  end
end
