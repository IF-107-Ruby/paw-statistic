class UserStruct < BaseModelStruct
  attr_accessor :github_id, :login, :avatar_url, :updated_on_github_at

  def initialize(json)
    @github_id = json[:id]
    @login = json[:login]
    @avatar_url = json[:avatar_url]
    @updated_on_github_at = json[:updated_at]
  end
end
