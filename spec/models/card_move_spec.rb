require 'rails_helper'

RSpec.describe CardMove, type: :model do
  describe 'associations' do
    it { should belong_to(:from).class_name('Column') }
    it { should belong_to(:to).class_name('Column') }
    it { should belong_to(:user) }
    it { should belong_to(:card) }
  end
end
