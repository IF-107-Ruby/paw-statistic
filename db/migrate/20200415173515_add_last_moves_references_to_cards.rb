class AddLastMovesReferencesToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :last_move_id, :integer

    add_foreign_key :cards, :card_moves, column: :last_move_id
  end
end
