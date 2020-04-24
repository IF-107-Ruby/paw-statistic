class IssueStruct < BaseModelStruct
  attr_accessor :github_id, :title, :state, :locked, :number, :html_url,
                :body, :updated_on_github_at, :user_json, :assignee_json

  def initialize(params)
    @github_id = params[:id]
    @title = params[:title]
    @state = params[:state]
    @locked = params[:locked]
    @number = params[:number]
    @html_url = params[:html_url]
    @body = params[:body]
    @updated_on_github_at = params[:updated_at]
    @user_json = params[:user]
    @assignee_json = params[:assignee]
  end

  def self.from_url(url)
    return if url.nil?

    issue_json = GithubApi.get(endpoint: url)
    IssueStruct.new(issue_json)
  end

  def user
    @user ||= UserStruct.new(user_json)
  end

  def assignee
    @assignee ||= UserStruct.new(assignee_json) unless assignee_json.nil?
  end

  def to_params
    { github_id: github_id, title: title, state: state,
      locked: locked, number: number, html_url: html_url,
      updated_on_github_at: updated_on_github_at }
  end

  alias to_hash to_params
end
