class HomeController < ApplicationController
  def index
    redirect_to :controller => 'owners'
  end

end
