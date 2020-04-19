PullRequestStruct = Struct.new(
  :github_id,
  :title,
  :state,
  :locked,
  :number,
  :html_url,
  :body,
  :updated_on_github_at
) do
  class << self
    def from_json(json)
      PullRequestStruct.new(
        json[:id], json[:title], json[:state], json[:locked],
        json[:number], json[:html_url], json[:body], json[:updated_at]
      )
    end
  end

  def to_hash
    {
      github_id: github_id,
      title: title,
      state: state,
      locked: locked,
      number: number,
      html_url: html_url,
      body: body,
      updated_on_github_at: updated_on_github_at
    }
  end
end
