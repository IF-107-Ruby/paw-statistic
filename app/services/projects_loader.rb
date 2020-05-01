class ProjectsLoader
  GITHUB_URL = 'https://api.github.com'.freeze

  def initialize(github_login:, github_repo:)
    @github_login = github_login
    @github_repo = github_repo
  end

  def run
    # return nil
    issues_json = GithubApi.get(endpoint: issues_url)
    issues_json.each { |issue_json| Issue.sync(issue_json) }

    Column.all.each do |column|
      cards_json = GithubApi.get(endpoint: cards_url(column.id))
      cards_json.each { |card_json| Card.sync(card_json) }
    end
  end

  alias load run

  private

  def cards_url(column_id)
    "#{GITHUB_URL}/projects/columns/#{column_id}/cards"
  end

  def issues_url
    "#{GITHUB_URL}/repos/#{@github_login}/#{@github_repo}/issues"
  end
end
