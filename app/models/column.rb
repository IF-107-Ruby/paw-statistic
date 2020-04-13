class Column < ApplicationRecord
  belongs_to :project
  has_many :cards, dependent: :nullify
end
