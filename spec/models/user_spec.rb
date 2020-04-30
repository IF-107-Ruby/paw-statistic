require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:projects) }
  it { should have_many(:cards) }
  it { should have_many(:issues) }
  it { should have_many(:card_moves) }
  it { should have_many(:assignments).class_name('Issue') }
end
