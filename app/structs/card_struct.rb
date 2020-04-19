CardStruct = Struct.new(
  :github_id,
  :note,
  :archived,
  :column_id,
  :content_url,
  :updated_on_github_at
) do
  class << self
    def from_json(json)
      CardStruct.new(
        json[:id],
        json[:note],
        json[:archived],
        json[:column_id],
        json[:content_url],
        json[:updated_at]
      )
    end
  end

  def issue
    IssueStruct.from_url(content_url)
  end

  def to_hash
    {
      github_id: github_id,
      note: note,
      archived: archived,
      updated_on_github_at: updated_on_github_at
    }
  end
end
