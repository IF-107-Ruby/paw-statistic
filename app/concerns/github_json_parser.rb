module GithubJsonParser
  extend ActiveSupport::Concern

  def card_params_from_github_json(json)
    {
      github_id: json[:id],
      note: json[:note],
      archived: json[:archived],
      updated_on_github_at: json[:updated_at]
    }
  end

  def issue_params_from_github_json(json)
    {
      github_id: json[:id],
      title: json[:title],
      state: json[:state],
      locked: json[:locked],
      number: json[:number],
      updated_on_github_at: json[:updated_at]
    }
  end

  def project_params_from_github_json(json)
    {
      github_id: json[:id],
      name: json[:name],
      body: json[:body],
      state: json[:state],
      number: json[:number],
      updated_on_github_at: json[:updated_at]
    }
  end

  def user_params_from_github_json(json)
    {
      github_id: json[:id],
      updated_on_github_at: json[:updated_at],
      login: json[:login]
    }
  end

  def column_params_from_github_json(json)
    {
      github_id: json[:id],
      name: json[:name],
      updated_on_github_at: json[:updated_at]
    }
  end

  def user_from_json(json)
    User.find_or_create(
      user_params_from_github_json(json)
    )
  end
end
