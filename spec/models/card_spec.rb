require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:column) }
    it { should belong_to(:issue) }
  end
end
