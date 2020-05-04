class BasicEventHandler
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def execute!; end

  def sender
    TeamMember.update_or_create(event.sender)
  end
end
