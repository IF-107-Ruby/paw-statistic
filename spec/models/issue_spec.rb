require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one(:card) }
  end
end
