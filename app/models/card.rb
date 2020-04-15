class Card < ApplicationRecord
  belongs_to :column
  belongs_to :user
  belongs_to :issue, optional: true
  has_many :moves, class_name: 'CardMove', dependent: :nullify
  belongs_to :last_move, class_name: 'CardMove', optional: true

  def move(from:, to:, moved_by:, moved_at:)
    move = CardMove.create(from: from, to: to, user: moved_by,
                           moved_at: moved_at, card: self)
    self.last_move = move
    update(column: to)
  end
end
