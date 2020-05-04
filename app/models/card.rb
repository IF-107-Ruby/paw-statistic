class Card < ApplicationRecord
  include GithubMethods

  belongs_to :column
  belongs_to :team_member
  belongs_to :issue, optional: true
  has_many :moves, class_name: 'CardMove', dependent: :destroy

  def move(to:, moved_by:, moved_at:)
    previos_move = moves.last
    moves.create(from: column, to: to, team_member: moved_by,
                 moved_at: moved_at, previos_move: previos_move)
    update(column: to, updated_on_github_at: moved_at)
  end

  def self.sync(json)
    struct = CardStruct.new(json)
    return if up_to_date?(struct)

    from_struct(struct)
  end

  def self.from_struct(struct)
    column = Column.find(struct.column_id)
    user = TeamMember.update_or_create(struct.creator)
    issue = Issue.from_struct(struct.issue) if struct.issue
    update_or_create(
      struct.with_params(column: column, team_member: user, issue: issue)
    )
  end
end
