class Card < ApplicationRecord
  include GithubMethods

  belongs_to :column
  belongs_to :user
  belongs_to :issue, optional: true
  has_many :moves, class_name: 'CardMove', dependent: :destroy

  def move(to:, moved_by:, moved_at:)
    previos_move = moves.last
    moves.create(from: column, to: to, user: moved_by,
                 moved_at: moved_at, previos_move: previos_move)
    update(column: to, updated_on_github_at: moved_at)
  end
end
