class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :confirm_admin, :except => [:index, :show]
end

def confirm_admin
  if ((params[:controller] != 'devise/sessions') and
      (params[:controller] != 'fantasy_players') and
      (not current_user.try(:admin?)))
    flash[:error] = "Must be Topher to do that!"
    logger.warn("confirm_admin check failed! You must be topher to do that")
    redirect_to :controller => 'home'
  end
end
