class PullRequestOpenedHandler < BasicEventHandler
  def execute!
    PullRequest.find_or_create(
      payload.pull_request.to_hash.merge(user: sender)
    )
  end
end
