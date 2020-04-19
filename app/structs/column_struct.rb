ColumnStruct = Struct.new(
  :github_id,
  :name,
  :project_url,
  :updated_on_github_at
) do
  class << self
    def from_json(json)
      ColumnStruct.new(
        json[:id],
        json[:name],
        json[:project_url],
        json[:updated_at]
      )
    end
  end

  def project
    ProjectStruct.from_url(project_url)
  end

  def to_hash
    {
      github_id: github_id,
      name: name,
      updated_on_github_at: updated_on_github_at
    }
  end
end
