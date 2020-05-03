require 'rails_helper'

RSpec.describe CardMove, type: :model do
  describe 'associations' do
    it { should belong_to(:from).class_name('Column') }
    it { should belong_to(:to).class_name('Column') }
    it { should belong_to(:team_member) }
    it { should belong_to(:card) }
    it { should belong_to(:next_move).class_name('CardMove').optional(true) }
    it { should have_one(:previos_move).class_name('CardMove').optional(true) }
  end
end
