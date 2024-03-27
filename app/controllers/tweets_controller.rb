# frozen_string_literal: true

# TweetsController
class TweetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    tweet = Tweet.new(tweet_params.merge(user: current_user))

    return unless tweet.save

    redirect_to dashboard_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
