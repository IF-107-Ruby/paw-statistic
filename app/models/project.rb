class Project < ApplicationRecord
  include GithubMethods

  belongs_to :user, optional: true
  has_many :columns, dependent: :destroy
end
