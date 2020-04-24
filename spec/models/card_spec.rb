require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:column) }
    it { should belong_to(:issue).optional(true) }
    it { should have_many(:moves).class_name('CardMove') }
  end

  describe '#move' do
    let(:card) { create(:card) }
    let(:user) { create(:user) }
    let(:column) { create(:column) }

    it 'should create new card_move and change card\'s column' do
      expect(card.column).not_to be_equal(column)
      card.move(to: column, moved_by: user, moved_at: Time.zone.now)
      expect(card.column).to be_equal(column)
    end
  end
end
