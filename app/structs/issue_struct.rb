class IssueStruct < BaseModelStruct
  attr_accessor :id, :title, :state, :locked, :number, :html_url,
                :body, :updated_on_github_at, :user_json, :assignee_json

  def initialize(params)
    @params = params
    @id = params[:id]
    @title = params[:title]
    @state = params[:state]
    @locked = params[:locked]
    @number = params[:number]
    @html_url = params[:html_url]
    @body = params[:body]
    @updated_on_github_at = params[:updated_at]
  end

  def self.from_url(url)
    return if url.nil?

    issue_json = GithubApi.get(endpoint: url)
    IssueStruct.new(issue_json)
  end

  def user
    user = @params[:user]
    @user ||= if user.is_a?(Hash)
                UserStruct.new(user)
              else
                user
              end
  end

  def assignee
    assignee = @params[:assignee]
    @assignee ||= if assignee.is_a?(Hash)
                    UserStruct.new(assignee)
                  else
                    assignee
                  end
  end

  def to_params
    params = main_params
    user.is_a?(ApplicationRecord) && params.merge!(user: user)
    assignee.is_a?(ApplicationRecord) && params.merge!(assignee: assignee)
    params
  end

  alias to_hash to_params

  private

  def main_params
    { id: id, title: title, state: state,
      locked: locked, number: number, html_url: html_url,
      updated_on_github_at: updated_on_github_at }
  end
end
