class Issue < ApplicationRecord
  belongs_to :user
  has_one :card, dependent: :destroy
end
