class UserStruct < BaseModelStruct
  attr_accessor :id, :login, :avatar_url, :updated_on_github_at

  def initialize(params)
    @id = params[:id]
    @login = params[:login]
    @avatar_url = params[:avatar_url]
    @updated_on_github_at = params[:updated_at]
  end

  def to_params
    main_params
  end

  alias to_hash to_params

  private

  def main_params
    { id: id, login: login, avatar_url: avatar_url,
      updated_on_github_at: updated_on_github_at }
  end
end
