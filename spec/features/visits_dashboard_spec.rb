require 'rails_helper'

feature 'Visits dashboard' do
  # let!(:user) { create(:team_member) }
  let!(:team_member_1) { create(:team_member, :with_assignment) }
  let!(:team_member_2) { create(:team_member, :with_assignment) }

  scenario 'successfully' do
    # login_as(user)
    visit root_path
    expect(page).to have_css 'h2', text: team_member_1.login
    expect(page).to have_link href: team_member_2.assignments.first.html_url
  end
end
