class EventStruct
  attr_accessor :payload

  def initialize(payload)
    @payload = payload
  end

  def action
    payload[:action]
  end

  def sender
    UserStruct.new(payload[:sender])
  end

  def project
    ProjectStruct.new(payload[:project])
  end

  def issue
    IssueStruct.new(payload[:issue])
  end

  def project_card
    CardStruct.new(payload[:project_card])
  end

  def assignee
    UserStruct.new(payload[:assignee])
  end

  def project_column
    ColumnStruct.new(payload[:project_column])
  end
end
