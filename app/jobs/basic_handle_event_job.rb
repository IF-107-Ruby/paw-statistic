class BasicHandleEventJob < ApplicationJob
  queue_as :default

  def perform(data)
    event = EventStruct.new data
    handler = get_handler(event)
    handler.execute!
  end

  private

  NullHandler = Class.new do
    def initialuze(_); end

    def execute!; end
  end

  def get_handler(event)
    handler_class(event.action).new(event)
  end

  def handler_class(_)
    NullHandler
  end
end
