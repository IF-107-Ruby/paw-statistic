class ProjectStruct < BaseModelStruct
  attr_accessor :github_id, :name, :body, :state, :number,
                :html_url, :updated_on_github_at

  def initialize(json)
    @github_id = json[:id]
    @name = json[:name]
    @body = json[:body]
    @state = json[:state]
    @number = json[:number]
    @html_url = json[:html_url]
    @updated_on_github_at = json[:updated_at]
  end

  def self.from_url(url)
    project_json = GithubApi.get(
      endpoint: url
    )
    ProjectStruct.new(project_json)
  end
end
