class UsersWithAssigniesQuery
  def self.call
    User
      .includes(assignments: { card: { moves: %i[to next_move] } })
      .joins(:assignments)
      .group(:id).order('count(users.id) desc')
  end
end
