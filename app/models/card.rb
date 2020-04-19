class Card < ApplicationRecord
  include GithubMethods

  belongs_to :column
  belongs_to :user
  belongs_to :issue, optional: true
  has_many :moves, class_name: 'CardMove', dependent: :destroy
  belongs_to :last_move, class_name: 'CardMove', optional: true

  def move(to:, moved_by:, moved_at:)
    move = CardMove.create(from: column, to: to, user: moved_by,
                           moved_at: moved_at, card: self)
    move.previos_move = last_move
    self.last_move = move
    update(column: to, updated_on_github_at: moved_at)
  end
end
