class PullRequestEditedHandler < BasicEventHandler
  def execute!
    PullRequest.find_and_update payload.pull_request
  end
end
