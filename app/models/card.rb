class Card < ApplicationRecord
  belongs_to :column
  belongs_to :user
  belongs_to :issue
end
