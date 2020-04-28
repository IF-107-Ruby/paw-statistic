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
    main_params.tap do |result|
      result[:user] = user if user.is_a?(ApplicationRecord)
    end
  end

  alias to_hash to_params

  private

  def main_params
    { id: id, name: name, state: state, body: body,
      number: number, html_url: html_url,
      updated_on_github_at: updated_on_github_at }
  end
end
