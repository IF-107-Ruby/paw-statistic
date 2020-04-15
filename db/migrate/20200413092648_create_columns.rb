class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.integer :column_id, null: false
      t.references :project, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index :columns, :column_id, unique: true
  end
end
