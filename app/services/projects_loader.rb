class ProjectsLoader
  def initialize(access_token:)
    @access_token = access_token
    GithubApi.client = GithubApi::Client.new access_token
  end

  def run
    projects = GithubApi.client.repo_projects(ENV['GITHUB_LOGIN'], ENV['GITHUB_REPO'])
    update_projects projects
  end

  alias load run

  private

  def update_projects(projects)
    projects.each do |proj|
      user = find_or_create_user proj.creator.as_json
      project = find_or_create_project proj.as_json.merge(user: user)
      update_project_columns project, proj.columns
    end
  end

  def update_project_columns(project, columns)
    columns.each do |col|
      column = find_or_create_column col.as_json.merge({ project: project })
      update_column_cards column, col.cards
    end
  end

  def update_column_cards(column, cards)
    cards.each do |card|
      card_creator = find_or_create_user card.creator.as_json
      issue = get_card_content card unless card.content.nil?
      find_or_create_card card.as_json.merge({ column: column,
                                               user: card_creator, issue: issue })
    end
  end

  def get_card_content(card)
    issue_opener = find_or_create_user card.content.user.as_json
    find_or_create_issue card.content.as_json.merge({ user: issue_opener })
  end

  def find_or_create_user(params)
    user = User.find_by(user_id: params[:user_id])
    if user.nil?
      user = User.create(params)
    else
      user.update(params)
    end
    user
  end

  def find_or_create_project(params)
    project = Project.find_by(project_id: params[:project_id])
    if project.nil?
      project = Project.create(params)
    else
      project.update(params)
    end
    project
  end

  def find_or_create_issue(params)
    issue = Issue.find_by(issue_id: params[:issue_id])
    if issue.nil?
      issue = Issue.create(params)
    else
      issue.update(params)
    end
    issue
  end

  def find_or_create_column(params)
    column = Column.find_by(column_id: params[:column_id])
    if column.nil?
      column = Column.create(params)
    else
      column.update(params)
    end
    column
  end

  def find_or_create_card(params)
    card = Card.find_by(card_id: params[:card_id])
    if card.nil?
      card = Card.create(params)
    else
      card.update(params)
    end
    card
  end
end
