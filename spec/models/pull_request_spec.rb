require 'rails_helper'

RSpec.describe PullRequest, type: :model do
  it { should belong_to(:user) }
end
