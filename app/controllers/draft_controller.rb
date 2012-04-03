class DraftController < ApplicationController
  def index
    @players = Player.all
  end
end
