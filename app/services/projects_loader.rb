class ProjectsLoader
  def initialize(access_token:)
    @access_token = access_token
    GithubApi.client = GithubApi::Client.new access_token
  end

  def run
    projects = GithubApi.client.repo_projects('IF-107-Ruby', 'paw-patrol')
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
      find_or_create_card card.as_json.merge({ column: column, user: card_creator })
    end
  end

  def find_or_create_user(params)
    User.find_by(user_id: params[:user_id]) || User.create(params)
  end

  def find_or_create_project(params)
    Project.find_by(project_id: params[:project_id]) || Project.create(params)
  end

  def find_or_create_column(params)
    Column.find_by(column_id: params[:column_id]) || Column.create(params)
  end

  def find_or_create_card(params)
    Card.find_by(card_id: params[:card_id]) || Card.create(params)
  end
end
