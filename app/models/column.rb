class Column < ApplicationRecord
  include GithubMethods

  belongs_to :project
  has_many :cards, dependent: :destroy
  has_many :from_moves,
           class_name: 'CardMove', inverse_of: 'from',
           dependent: :destroy, foreign_key: 'from_id'
  has_many :to_moves,
           class_name: 'CardMove', inverse_of: 'to',
           dependent: :destroy, foreign_key: 'to_id'
end
