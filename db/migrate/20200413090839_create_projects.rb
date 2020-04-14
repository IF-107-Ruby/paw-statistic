class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :project_id, null: false
      t.references :user, null: true, foreign_key: true
      t.string :name
      t.string :body
      t.integer :number
      t.string :state

      t.timestamps
    end

    add_index :projects, :project_id, unique: true
  end
end
