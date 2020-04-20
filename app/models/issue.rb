class Issue < ApplicationRecord
  include GithubMethods
  default_scope -> { order_by_state }

  belongs_to :user
  has_one :card, dependent: :destroy
  belongs_to :assignee, class_name: 'User', optional: true

  def self.order_by_state
    order("CASE issues.state
            WHEN 'open'   THEN '1'
            WHEN 'closed' THEN '2'
          END")
  end
end
