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
    user = @params[:user]
    @_user ||= if user.is_a?(Hash)
                 UserStruct.new(user)
               else
                 user
               end
  end

  def assignee
    assignee = @params[:assignee]
    @_assignee ||= if assignee.is_a?(Hash)
                     UserStruct.new(assignee)
                   else
                     assignee
                   end
  end

  def to_params
    super.slice(:id, :title, :state, :locked, :body,
                :number, :html_url, :updated_on_github_at).tap do |result|
      result[:user] = user if user.is_a?(ApplicationRecord)
      result[:assignee] = assignee if assignee.is_a?(ApplicationRecord)
    end
  end

  alias to_hash to_params
end
