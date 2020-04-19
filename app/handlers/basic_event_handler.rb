class BasicEventHandler
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def execute!; end

  def sender
    User.find_or_create payload.sender.to_hash
  end
end
