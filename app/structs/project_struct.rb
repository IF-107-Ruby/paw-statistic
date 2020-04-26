class ProjectStruct < BaseModelStruct
  attr_accessor :id, :name, :body, :state, :number,
                :html_url, :updated_on_github_at, :user

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
    @body = params[:body]
    @state = params[:state]
    @number = params[:number]
    @html_url = params[:html_url]
    @updated_on_github_at = params[:updated_at]
    @user = params[:user]
  end

  def self.from_url(url)
    project_json = GithubApi.get(
      endpoint: url
    )
    ProjectStruct.new(project_json)
  end

  def to_params
    super.slice(:id, :name, :state, :number, :body,
                :html_url, :updated_on_github_at).tap do |result|
      result[:user] = user if user.is_a?(ApplicationRecord)
    end
  end

  alias to_hash to_params
end
