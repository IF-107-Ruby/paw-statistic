class BasicEventHandler
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def execute!; end

  def sender
    User.update_or_create event.sender
  end
end
