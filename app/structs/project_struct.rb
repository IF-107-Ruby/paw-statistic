class ProjectStruct < BaseModelStruct
  attr_accessor :github_id, :name, :body, :state, :number,
                :html_url, :updated_on_github_at

  def initialize(params)
    @github_id = params[:id]
    @name = params[:name]
    @body = params[:body]
    @state = params[:state]
    @number = params[:number]
    @html_url = params[:html_url]
    @updated_on_github_at = params[:updated_at]
  end

  def self.from_url(url)
    project_json = GithubApi.get(
      endpoint: url
    )
    ProjectStruct.new(project_json)
  end
end
