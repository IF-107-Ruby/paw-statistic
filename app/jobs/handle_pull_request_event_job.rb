class HandlePullRequestEventJob < ApplicationJob
  include HandleEventJob
  queue_as :default

  private

  def get_handler(action)
    case action
    when 'opened' then PullRequestOpenedHandler
    when 'edited' then PullRequestEditedHandler; end
  end
end
