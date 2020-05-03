require 'rails_helper'

RSpec.describe 'Dashboards', type: :request do
  describe 'GET#show' do
    let!(:user) { create(:team_member) }
    it 'returns http success' do
      login_as(user)
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
