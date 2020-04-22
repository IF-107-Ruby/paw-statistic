class IssueStruct < BaseModelStruct
  attr_accessor :github_id, :title, :state, :locked, :number, :html_url,
                :body, :updated_on_github_at, :user_json, :assignee_json

  def initialize(json)
    @github_id = json[:id]
    @title = json[:title]
    @state = json[:state]
    @locked = json[:locked]
    @number = json[:number]
    @html_url = json[:html_url]
    @body = json[:body]
    @updated_on_github_at = json[:updated_at]
    @user_json = json[:user]
    @assignee_json = json[:assignee]
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

  def as_json
    { github_id: github_id, title: title, state: state,
      locked: locked, number: number, html_url: html_url,
      updated_on_github_at: updated_on_github_at }
  end
end
