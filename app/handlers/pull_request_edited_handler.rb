class PullRequestEditedHandler < BasicEventHandler
  def execute!
    PullRequest.update_or_create payload.pull_request
  end
end
