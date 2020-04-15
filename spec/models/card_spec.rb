require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:column) }
    it { should belong_to(:issue).optional(true) }
    it { should have_many(:moves) }
    it { should belong_to(:last_move).class_name('CardMove').optional(true) }
  end
end
