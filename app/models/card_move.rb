class CardMove < ApplicationRecord
  include GithubMethods

  belongs_to :from, class_name: 'Column'
  belongs_to :to, class_name: 'Column'
  belongs_to :user
  belongs_to :card
  belongs_to :next_move, class_name: 'CardMove', optional: true

  has_one :previos_move, class_name: 'CardMove', inverse_of: 'next_move',
                         dependent: :nullify, foreign_key: 'next_move_id'
end
