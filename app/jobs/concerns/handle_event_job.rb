module HandleEventJob
  extend ActiveSupport::Concern

  def perform(data)
    payload = PayloadStruct.new data
    handler = get_handler(payload.action)
    handler&.new(payload)&.execute!
  end

  private

  def get_handler(action); end
end
