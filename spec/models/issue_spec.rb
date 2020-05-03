require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'associations' do
    it { should belong_to(:team_member) }
    it { should have_one(:card) }
    it { should belong_to(:assignee).class_name('TeamMember').optional(true) }
  end

  describe '#remove_assignee' do
    let(:issue) { create(:issue, :with_assignee) }

    it 'should set assignee to nil' do
      expect(issue.assignee).not_to be_equal(nil)
      issue.remove_assignee
      expect(issue.assignee).to be_equal(nil)
    end
  end
end
