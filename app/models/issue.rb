class Issue < ApplicationRecord
  belongs_to :user
  has_one :card, dependent: :destroy
  belongs_to :assignee, class_name: 'User', optional: true
end
