class AddHtmlUrlToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :html_url, :string
  end
end
