class CreatePullRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :pull_requests do |t|
      t.integer :github_id
      t.string :html_url
      t.integer :number
      t.string :state
      t.string :title
      t.boolean :locked
      t.references :user, null: false, foreign_key: true
      t.string :body
      t.datetime :updated_on_github_at

      t.timestamps
    end

    add_index :pull_requests, :github_id, unique: true
  end
end
