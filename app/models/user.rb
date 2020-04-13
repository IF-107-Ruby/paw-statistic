class User < ApplicationRecord
  has_many :projects, dependent: :nullify
  has_many :cards, dependent: :nullify
end
