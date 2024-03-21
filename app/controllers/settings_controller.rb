class SettingsController < ApplicationController
  before_action :authenticate_user!
  
  def update
    if current_user.update(settings_params)
      flash[:notice] = 'Settings successfully updated.'
      redirect_to dashboard_path
    end
  end

  private

  def settings_params
    params.require(:user).permit(:avatar)
  end
end
