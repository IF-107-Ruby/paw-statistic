class ProjectsLoader
  GITHUB_URL = 'https://api.github.com'.freeze

  def initialize(github_login:, github_repo:)
    @github_login = github_login
    @github_repo = github_repo
  end

  def run
    projects_url = "#{GITHUB_URL}/repos/#{@github_login}/#{@github_repo}/projects"
    projects_json = GithubApi.get(endpoint: projects_url)
    update_projects(projects_json)
  end

  alias load run

  private

  def update_projects(projects_json)
    projects_json.each do |json|
      project_struct = ProjectStruct.new(json)
      next if Project.up_to_date?(project_struct)

      user = User.update_or_create UserStruct.new(json[:creator])
      project = Project.update_or_create(
        project_struct.with_params(user: user)
      )

      columns_json = GithubApi.get(endpoint: json[:columns_url])
      update_project_columns(project, columns_json)
    end
  end

  def update_project_columns(project, columns_json)
    columns_json.each do |json|
      column_struct = ColumnStruct.new(json)
      next if Column.up_to_date?(column_struct)

      column = Column.update_or_create(
        column_struct.with_params(project: project)
      )
      cards_json = GithubApi.get(endpoint: json[:cards_url])
      update_project_cards(column, cards_json)
    end
  end

  def update_project_cards(column, cards_json)
    cards_json.each do |json|
      card_struct = CardStruct.new(json)
      next if Card.up_to_date?(card_struct)

      user = User.update_or_create UserStruct.new(json[:creator])
      issue = card_issue_from_url(json[:content_url])
      Card.update_or_create(
        card_struct.with_params(column: column, user: user, issue: issue)
      )
    end
  end

  def card_issue_from_url(url)
    issue_struct = IssueStruct.from_url(url)
    issue_opener = User.update_or_create(issue_struct.user)
    assignee = User.update_or_create issue_struct.assignee if issue_struct.assignee
    Issue.update_or_create issue_struct
      .with_params(user: issue_opener, assignee: assignee)
  end
end
