class SetIssuesPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  class Issue < ApplicationRecord
    has_one :card, dependent: :nullify
  end

  class Card < ApplicationRecord
    belongs_to :issue, optional: true
  end

  def change
    ActiveRecord::Base.transaction do
      Issue.all.each do |issue|
        new_issue_json = issue.as_json
        new_issue_json[:id] = issue.github_id
        new_issue_json[:github_id] = issue.id
        new_issue = Issue.create(new_issue_json)

        issue.card.update(issue: new_issue)

        issue.destroy
      end
      remove_index :issues, :github_id
      remove_column :issues, :github_id, :integer
    end
  end
end
