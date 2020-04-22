class PayloadStruct
  attr_accessor :payload

  delegate :issue, to: :project_card, prefix: true

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

  def pull_request
    PullRequestStruct.new(payload[:pull_request])
  end
end
