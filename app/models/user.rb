class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_many :card_moves, dependent: :destroy
  has_many :assignies, dependent: :nullify, inverse_of: 'assignee',
                       class_name: 'Issue', foreign_key: 'assignee_id'
end
