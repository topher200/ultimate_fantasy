class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :confirm_admin, :except => [:index, :show]
end

def confirm_admin
  if not current_user.try(:admin?)
    logger.error("Must be Topher to do that!")
    redirect_to :controller => '/home'
  end
end
