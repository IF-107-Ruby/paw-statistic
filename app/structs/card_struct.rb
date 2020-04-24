class CardStruct < BaseModelStruct
  attr_reader :id, :note, :archived, :column_id,
              :content_url, :updated_on_github_at

  def initialize(params)
    @params = params
    @id = params[:id]
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
    params = main_params
    @params[:column].is_a?(ApplicationRecord) && params.merge!(column: @params[:column])
    @params[:user].is_a?(ApplicationRecord) && params.merge!(user: @params[:user])
    @params[:issue].is_a?(ApplicationRecord) && params.merge!(issue: @params[:issue])
    params
  end

  alias to_hash to_params

  private

  def main_params
    {
      id: id,
      note: note,
      archived: archived,
      updated_on_github_at: updated_on_github_at
    }
  end
end
