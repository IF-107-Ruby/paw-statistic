class ColumnStruct < BaseModelStruct
  attr_accessor :github_id, :name, :project_url, :updated_on_github_at

  def initialize(json)
    @github_id = json[:id]
    @name = json[:name]
    @project_url = json[:project_url]
    @updated_on_github_at = json[:updated_at]
  end

  def project
    @project ||= ProjectStruct.from_url(project_url)
  end

  def as_json
    {
      github_id: github_id,
      name: name,
      updated_on_github_at: updated_on_github_at
    }
  end
end
