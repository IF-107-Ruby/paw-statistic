ProjectStruct = Struct.new(
  :github_id,
  :name,
  :body,
  :state,
  :number,
  :html_url,
  :updated_on_github_at
) do
  class << self
    def from_json(json)
      ProjectStruct.new(
        json[:id], json[:name], json[:body], json[:state],
        json[:number], json[:html_url], json[:updated_at]
      )
    end

    def from_url(url)
      project_json = GithubApi.get(
        endpoint: url
      )
      ProjectStruct.from_json(project_json)
    end
  end

  def to_hash
    {
      github_id: github_id,
      name: name,
      body: state,
      number: number,
      html_url: html_url,
      updated_on_github_at: updated_on_github_at
    }
  end
end
