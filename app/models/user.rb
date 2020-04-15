class User < ApplicationRecord
  has_many :projects, dependent: :nullify
  has_many :cards, dependent: :nullify
  has_many :issues, dependent: :nullify
  has_many :card_moves, dependent: :nullify

  class << self
    def create_from_github_event(data)
      create user_id: data['id'], login: data['login']
    end
  end
end
