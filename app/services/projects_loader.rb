class ProjectsLoader
  GITHUB_URL = 'https://api.github.com'.freeze
  include ::GithubJsonParser

  def initialize(github_login:, github_repo:)
    @github_login = github_login
    @github_repo = github_repo
  end

  def run
    projects_url = "#{GITHUB_URL}/repos/#{@github_login}/#{@github_repo}/projects"
    projects_json = GithubApi.get(endpoint: projects_url)
    update_projects projects_json
  end

  alias load run

  private

  def update_projects(projects_json)
    projects_json.each do |json|
      params = project_params_from_github_json(json)
      next if Project.up_to_date? params

      project = Project.update_or_create(
        params.merge(user: user_from_json(json[:creator]))
      )
      columns_json = GithubApi.get(endpoint: json[:columns_url])
      update_project_columns project, columns_json
    end
  end

  def update_project_columns(project, columns_json)
    columns_json.each do |json|
      params = column_params_from_github_json(json)
      next if Column.up_to_date? params

      column = Column.update_or_create(
        params.merge(project: project)
      )
      cards_json = GithubApi.get(endpoint: json[:cards_url])
      update_project_cards column, cards_json
    end
  end

  def update_project_cards(column, cards_json)
    cards_json.each do |json|
      params = card_params_from_github_json(json)
      next if Card.up_to_date? params

      user = user_from_json(json[:creator])
      issue = issue_from_url(json[:content_url])
      Card.update_or_create(
        params.merge(column: column, user: user, issue: issue)
      )
    end
  end

  def issue_from_url(url)
    return if url.nil?

    issue_json = GithubApi.get(endpoint: url)
    user = user_from_json(issue_json[:user])
    Issue.update_or_create(
      issue_params_from_github_json(issue_json).merge(user: user)
    )
  end
end
