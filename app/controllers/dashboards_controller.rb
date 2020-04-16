class DashboardsController < ApplicationController
  def show
    @projects = Project.all.includes(columns: { cards:
      [{ issue: :user }, :user, { last_move: :user }] })
    @repo = ENV['GITHUB_REPO']
  end
end
