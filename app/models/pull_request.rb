class PullRequest < ApplicationRecord
  include GithubMethods

  belongs_to :user
end
