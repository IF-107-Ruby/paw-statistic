require 'rails_helper'

RSpec.describe Column, type: :model do
  it { should belong_to(:project) }
  it { should have_many(:cards) }
  it { should have_many(:from_moves).class_name('CardMove') }
  it { should have_many(:to_moves).class_name('CardMove') }
end
