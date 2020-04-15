class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :card_id, null: false
      t.references :column, null: false, foreign_key: true
      t.string :note
      t.references :user, null: true, foreign_key: true
      t.boolean :archived, default: false

      t.timestamps
    end

    add_index :cards, :card_id, unique: true
  end
end
