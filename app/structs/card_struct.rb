class CardStruct < BaseModelStruct
  attr_reader :github_id, :note, :archived, :column_id,
              :content_url, :updated_on_github_at

  def initialize(params)
    @github_id = params[:id]
    @note = params[:note]
    @archived = params[:archived]
    @column_id = params[:column_id]
    @content_url = params[:content_url]
    @updated_on_github_at = params[:updated_at]
  end

  def issue
    @issue ||= IssueStruct.from_url(content_url)
  end

  def to_params
    {
      github_id: github_id,
      note: note,
      archived: archived,
      updated_on_github_at: updated_on_github_at
    }
  end

  alias to_hash to_params
end
