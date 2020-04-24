class SetUsersPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  class User < ApplicationRecord
    has_many :projects, dependent: :nullify
    has_many :cards, dependent: :nullify
    has_many :issues, dependent: :nullify
    has_many :card_moves, dependent: :nullify
    has_many :assignies, dependent: :nullify, inverse_of: 'assignee',
                         class_name: 'Issue', foreign_key: 'assignee_id'
  end

  class Card < ApplicationRecord
    belongs_to :user
  end

  class CardMove < ApplicationRecord
    belongs_to :user
  end

  class Issue < ApplicationRecord
    belongs_to :user
    belongs_to :assignee, class_name: 'User', optional: true
  end

  class Project < ApplicationRecord
    belongs_to :user, optional: true
  end

  def change
    ActiveRecord::Base.transaction do
      User.all.each do |user|
        new_user_json = user.as_json
        new_user_json[:id] = user.github_id
        new_user_json[:github_id] = user.id
        new_user = User.create(new_user_json)

        user.projects.each { |obj| obj.update(user: new_user) }
        user.cards.each { |obj| obj.update(user: new_user) }
        user.issues.each { |obj| obj.update(user: new_user) }
        user.card_moves.each { |obj| obj.update(user: new_user) }
        user.assignies.each { |issue| issue.update(assignee: new_user) }

        user.destroy
      end
      remove_index :users, :github_id
      remove_column :users, :github_id, :integer
    end
  end
end
