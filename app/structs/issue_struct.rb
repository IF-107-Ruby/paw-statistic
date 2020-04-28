class IssueStruct < BaseModelStruct
  attr_accessor :id, :title, :state, :locked, :number,
                :html_url, :body, :updated_on_github_at

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
    params_user = @params[:user]
    @user ||= if params_user.is_a?(Hash)
                UserStruct.new(params_user)
              else
                params_user
              end
  end

  def assignee
    params_assignee = @params[:assignee]
    @assignee ||= if params_assignee.is_a?(Hash)
                    UserStruct.new(params_assignee)
                  else
                    params_assignee
                  end
  end

  def to_params
    main_params.tap do |result|
      result[:user] = user if user.is_a?(ApplicationRecord)
      result[:assignee] = assignee if assignee.is_a?(ApplicationRecord)
    end
  end

  alias to_hash to_params

  private

  def main_params
    { id: id, title: title, state: state, locked: locked,
      body: body, number: number, html_url: html_url,
      updated_on_github_at: updated_on_github_at }
  end
end
