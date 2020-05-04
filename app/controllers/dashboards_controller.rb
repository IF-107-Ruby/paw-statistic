class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @team_members = UsersWithAssigniesQuery.call
  end
end
