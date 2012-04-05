class HomeController < ApplicationController
  def index
    redirect_to :controller => 'players'
  end

end
