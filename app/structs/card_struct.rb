class CardStruct < BaseModelStruct
  attr_reader :github_id, :note, :archived, :column_id,
              :content_url, :updated_on_github_at

  def initialize(json)
    @github_id = json[:id]
    @note = json[:note]
    @archived = json[:archived]
    @column_id = json[:column_id]
    @content_url = json[:content_url]
    @updated_on_github_at = json[:updated_at]
  end

  def issue
    @issue ||= IssueStruct.from_url(content_url)
  end

  def as_json
    {
      github_id: github_id,
      note: note,
      archived: archived,
      updated_on_github_at: updated_on_github_at
    }
  end
end
