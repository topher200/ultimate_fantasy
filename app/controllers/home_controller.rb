class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :controller => 'roster'
    else
      redirect_to :controller => 'owners'
    end
  end

end
