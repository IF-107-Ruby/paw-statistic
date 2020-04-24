class ColumnStruct < BaseModelStruct
  attr_accessor :github_id, :name, :project_url, :updated_on_github_at

  def initialize(params)
    @github_id = params[:id]
    @name = params[:name]
    @project_url = params[:project_url]
    @updated_on_github_at = params[:updated_at]
  end

  def project
    @project ||= ProjectStruct.from_url(project_url)
  end

  def to_params
    {
      github_id: github_id,
      name: name,
      updated_on_github_at: updated_on_github_at
    }
  end

  alias to_hash to_params
end
