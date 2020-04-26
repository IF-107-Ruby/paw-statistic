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
    super.slice(:id, :note, :archived, :content_url,
                :updated_on_github_at).tap do |result|
      result[:column] = @params[:column] if @params[:column].is_a?(ApplicationRecord)
      result[:user] = @params[:user] if @params[:user].is_a?(ApplicationRecord)
      result[:issue] = @params[:issue] if @params[:issue].is_a?(ApplicationRecord)
    end
  end

  alias to_hash to_params
end
