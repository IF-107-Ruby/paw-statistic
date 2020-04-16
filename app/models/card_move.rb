class CardMove < ApplicationRecord
  belongs_to :from, class_name: 'Column'
  belongs_to :to, class_name: 'Column'
  belongs_to :user
  belongs_to :card
  has_one :cards_last_move,
          class_name: 'Card', inverse_of: 'last_move',
          foreign_key: 'last_move_id', dependent: :nullify
end
