class AddColumnsToIssues < ActiveRecord::Migration[6.0]
  def change
    change_table :issues, bulk: true do |t|
      t.string :html_url
      t.string :body
    end
  end
end
