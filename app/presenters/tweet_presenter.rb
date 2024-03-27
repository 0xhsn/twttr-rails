# frozen_string_literal: true

# TweetPresenter 
class TweetPresenter
  include ActionView::Helpers::DateHelper

  def initialize(tweet, current_user)
    @tweet = tweet
    @current_user = current_user
  end

  attr_reader :tweet, :current_user

  delegate :user, :body, :likes_count, :likes, to: :tweet
  delegate :username, :avatar, to: :user

  def created_at
    if (Time.zone.now - tweet.created_at) > 1.day
      tweet.created_at.strftime('%b %-d')
    else
      time_ago_in_words(tweet.created_at)
    end
  end
end