class PullRequestStruct < BaseModelStruct
  attr_accessor :github_id, :title, :state, :locked, :number,
                :html_url, :body, :updated_on_github_at

  def initialize(json)
    @github_id = json[:id]
    @title = json[:title]
    @state = json[:state]
    @locked = json[:locked]
    @number = json[:number]
    @html_url = json[:html_url]
    @body = json[:body]
    @updated_on_github_at = json[:updated_at]
  end
end
