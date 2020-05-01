class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @users = UsersWithAssigniesQuery.call
  end
end
