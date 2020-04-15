class CardMove < ApplicationRecord
  belongs_to :from, class_name: 'Column'
  belongs_to :to, class_name: 'Column'
  belongs_to :user
  belongs_to :card
end
