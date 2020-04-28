class CardStruct < BaseModelStruct
  attr_reader :id, :note, :archived,
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

  def column_id
    @column_id ||= @params[:column_url].split('/').last.to_i
  end

  def creator
    @creator = UserStruct.new(@params[:creator])
  end

  def to_params
    main_params.tap do |result|
      result[:column] = @params[:column] if @params[:column].is_a?(ApplicationRecord)
      result[:user] = @params[:user] if @params[:user].is_a?(ApplicationRecord)
      result[:issue] = @params[:issue] if @params[:issue].is_a?(ApplicationRecord)
    end
  end

  alias to_hash to_params

  private

  def main_params
    { id: id, note: note, archived: archived,
      content_url: content_url,
      updated_on_github_at: updated_on_github_at }
  end
end
