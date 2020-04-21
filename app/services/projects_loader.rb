class ProjectsLoader
  GITHUB_URL = 'https://api.github.com'.freeze

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
      project_struct = ProjectStruct.from_json(json)
      next if Project.up_to_date? project_struct

      user = User.update_or_create UserStruct.from_json(json[:creator]).to_hash
      project = Project.update_or_create(
        project_struct.to_hash.merge(user: user)
      )

      columns_json = GithubApi.get(endpoint: json[:columns_url])
      update_project_columns project, columns_json
    end
  end

  def update_project_columns(project, columns_json)
    columns_json.each do |json|
      column_struct = ColumnStruct.from_json json
      next if Column.up_to_date? column_struct

      column = Column.update_or_create(
        column_struct.to_hash.merge(project: project)
      )
      cards_json = GithubApi.get(endpoint: json[:cards_url])
      update_project_cards column, cards_json
    end
  end

  def update_project_cards(column, cards_json)
    cards_json.each do |json|
      card_struct = CardStruct.from_json json
      next if Card.up_to_date? card_struct

      user = User.update_or_create UserStruct.from_json(json[:creator]).to_hash
      issue = card_issue_from_url(json[:content_url])
      Card.update_or_create(
        card_struct.to_hash.merge(column: column, user: user, issue: issue)
      )
    end
  end

  def card_issue_from_url(url)
    issue_struct = IssueStruct.from_url(url)
    issue_opener = User.update_or_create issue_struct.user.to_hash
    if issue_struct.assignee
      assignee = User.update_or_create issue_struct.assignee.to_hash
    end
    Issue.update_or_create issue_struct
      .to_hash.merge(user: issue_opener, assignee: assignee)
  end
end
