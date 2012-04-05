class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with  :name => "topher", :password => "nickreed", \
    :except => [:index, :show] 
end
