PayloadStruct = Struct.new(:payload) do
  def action
    payload[:action]
  end

  def sender
    UserStruct.from_json(payload[:sender])
  end

  def project
    ProjectStruct.from_json(payload[:project])
  end

  def issue
    IssueStruct.from_json(payload[:issue])
  end

  def project_card
    CardStruct.from_json(payload[:project_card])
  end

  def assignee
    UserStruct.from_json(payload[:assignee])
  end

  def project_column
    ColumnStruct.from_json(payload[:project_column])
  end

  def pull_request
    PullRequestStruct.from_json(payload[:pull_request])
  end
end
