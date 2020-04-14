class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.integer :issue_id
      t.string :title
      t.references :user, null: true, foreign_key: true
      t.string :state
      t.boolean :locked
      t.integer :number

      t.timestamps
    end

    add_index :issues, :issue_id, unique: true
  end
end
