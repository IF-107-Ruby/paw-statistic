class UsersWithAssigniesQuery
  def self.call
    TeamMember
      .includes(assignments: { card: { moves: %i[to next_move] } })
      .joins(:assignments)
      .group(:id).order('count(team_members.id) desc')
  end
end
