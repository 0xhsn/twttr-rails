# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /index' do
    context 'when not signed in' do
      it 'responds with redirect' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context 'when not signed in' do
      it 'is successful' do
        user = create(:user)
        sign_in user
        get root_path
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end
