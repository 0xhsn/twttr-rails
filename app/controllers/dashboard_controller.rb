# frozen_string_literal: true

# DashboardController
class DashboardController < ActionController::Base
  before_action :authenticate_user!
  def index
  end
end
