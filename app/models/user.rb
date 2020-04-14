class User < ApplicationRecord
  has_many :projects, dependent: :nullify
  has_many :cards, dependent: :nullify
  has_many :issues, dependent: :nullify
end
