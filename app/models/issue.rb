class Issue < ApplicationRecord
  include GithubMethods
  scope :order_by_state, lambda {
                           order("CASE issues.state
                                    WHEN 'open'   THEN '1'
                                    WHEN 'closed' THEN '2'
                                  END")
                         }

  belongs_to :user
  has_one :card, dependent: :destroy
  belongs_to :assignee, class_name: 'User', optional: true
end
