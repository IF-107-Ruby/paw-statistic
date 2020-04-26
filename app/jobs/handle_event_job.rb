class HandleEventJob < ApplicationJob
  queue_as :default

  def perform(event_type, data)
    event = EventStruct.new event_type, data
    handler = get_handler(event)
    handler.execute!
  rescue NameError => e
    logger.error(e)
  end

  private

  def get_handler(event)
    handler_class(event.type, event.action).new(event)
  end

  def handler_class(type, action)
    "#{type.classify}#{action.classify}Handler".constantize
  end
end
