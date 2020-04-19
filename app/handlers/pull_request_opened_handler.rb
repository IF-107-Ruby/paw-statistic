class PullRequestOpenedHandler < BasicEventHandler
  def execute!
    PullRequest.update_or_create(
      payload.pull_request.to_hash.merge(user: sender)
    )
  end
end
