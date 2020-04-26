class HandleEventJob < ApplicationJob
  queue_as :default

  def perform(event_type, data)
    event = EventStruct.new event_type, data
    handler = get_handler(event)
    handler.execute!
  end

  private

  NullHandler = Class.new do
    def self.execute!; end
  end

  def get_handler(event)
    handler_class(event.type, event.action).new(event)
  rescue NameError
    NullHandler
  end

  def handler_class(type, action)
    "#{type.classify}#{action.classify}Handler".constantize
  end
end
