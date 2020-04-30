require 'rails_helper'

feature 'Visits dashboard' do
  let!(:user_1) { create(:user, :with_assignment) }
  let!(:user_2) { create(:user, :with_assignment) }

  scenario 'successfully' do
    visit root_path
    expect(page).to have_css 'h2', text: user_1.login
    expect(page).to have_link href: user_2.assignments.first.html_url
  end
end
