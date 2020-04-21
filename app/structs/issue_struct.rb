IssueStruct = Struct.new(
  :github_id,
  :title,
  :state,
  :locked,
  :number,
  :html_url,
  :body,
  :updated_on_github_at,
  :user_json,
  :assignee_json
) do
  class << self
    def from_json(json)
      IssueStruct.new(
        json[:id], json[:title], json[:state], json[:locked],
        json[:number], json[:html_url], json[:body], json[:updated_at],\
        json[:user], json[:assignee]
      )
    end

    def from_url(url)
      return if url.nil?

      issue_json = GithubApi.get(endpoint: url)
      IssueStruct.from_json(issue_json)
    end
  end

  def user
    UserStruct.from_json(user_json)
  end

  def assignee
    UserStruct.from_json(assignee_json) unless assignee_json.nil?
  end

  def to_hash
    {
      github_id: github_id, title: title, state: state,
      locked: locked, number: number, html_url: html_url,
      updated_on_github_at: updated_on_github_at
    }
  end
end
