class AddIssuesReferencesToCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :issue, null: true, foreign_key: true
  end
end
