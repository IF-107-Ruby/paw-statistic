class UserStruct < BaseModelStruct
  attr_accessor :github_id, :login, :avatar_url, :updated_on_github_at

  def initialize(params)
    @github_id = params[:id]
    @login = params[:login]
    @avatar_url = params[:avatar_url]
    @updated_on_github_at = params[:updated_at]
  end
end
