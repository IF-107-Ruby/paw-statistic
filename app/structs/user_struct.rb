UserStruct = Struct.new(
  :github_id,
  :login,
  :avatar_url,
  :updated_on_github_at
) do
  class << self
    def from_json(json)
      UserStruct.new(
        json[:id],
        json[:login],
        json[:avatar_url],
        json[:updated_at]
      )
    end
  end

  def to_hash
    {
      github_id: github_id,
      login: login,
      avatar_url: avatar_url,
      updated_on_github_at: updated_on_github_at
    }
  end
end
