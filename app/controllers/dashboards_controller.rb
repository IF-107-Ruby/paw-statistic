class DashboardsController < ApplicationController
  def show
    @users = UsersWithAssigniesQuery.call
  end
end
