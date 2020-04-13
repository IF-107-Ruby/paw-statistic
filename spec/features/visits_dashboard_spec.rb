require 'rails_helper'

feature 'Visits dashboard' do
  let!(:project) { create(:project) }

  scenario 'successfully' do
    visit root_path
    expect(page).to have_css 'h2', text: project.name
  end
end
