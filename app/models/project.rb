class Project < ApplicationRecord
  include GithubMethods

  belongs_to :team_member, optional: true
  has_many :columns, dependent: :destroy
end
