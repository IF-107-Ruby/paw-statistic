class SetProjectsPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  class Project < ApplicationRecord
    has_many :columns, dependent: :nullify
  end

  class Column < ApplicationRecord
    belongs_to :project
  end

  def change
    ActiveRecord::Base.transaction do
      Project.all.each do |project|
        new_project_json = project.as_json
        new_project_json[:id] = project.github_id
        new_project_json[:github_id] = project.id
        new_project = Project.create(new_project_json)

        project.columns.each { |column| column.update(project: new_project) }

        project.destroy
      end
      remove_index :projects, :github_id
      remove_column :projects, :github_id, :integer
    end
  end
end
