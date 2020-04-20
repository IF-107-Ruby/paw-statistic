class DashboardsController < ApplicationController
  def show
    @users = UsersWithAssigniesQuery.new.call
  end
end
