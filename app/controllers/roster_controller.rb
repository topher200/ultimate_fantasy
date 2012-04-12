class RosterController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    owner = User.find_owner_for_user(current_user)
    @page_title = "#{owner.name}'s Roster"
    @players_by_status = FantasyPlayer.current_players_for_owner_by_status(owner)
    @statuses = [["1", "Starters"], ["2", "Negative"], [nil, "Bench"]]
  end
end
