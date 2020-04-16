class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_many :card_moves, dependent: :destroy
end
