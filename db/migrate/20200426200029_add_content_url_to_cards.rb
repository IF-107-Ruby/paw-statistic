class AddContentUrlToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :content_url, :string
  end
end
