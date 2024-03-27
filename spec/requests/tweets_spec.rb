# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  describe 'GET show' do
    it 'succeeds' do
      user = create(:user)
      tweet = create(:tweet)
      get tweet_path(tweet)
      expect(response).to have_http_status(302) # because of turbo
    end
  end

  describe 'POST create' do
    context 'when not signed in' do
      it 'responds with redirect' do
        post tweets_path, params: {
          tweet: {
            body: 'example tweet body'
          }
        }
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'when not signed in' do
      it 'is successful' do
        user = create(:user)
        sign_in user
        expect do
          post tweets_path, params: {
            tweet: {
              body: 'sup, this is a new tweet'
            }
          }
        end.to change { Tweet.count }.by(1)
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end
