class BasicEventHandler
  attr_reader :payload

  alias params payload

  def initialize(payload)
    @payload = payload
  end

  def execute!; end

  def sender
    User.update_or_create params.sender
  end
end
