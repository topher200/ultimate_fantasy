class RosterController < ApplicationController
  prepend_before_filter :authenticate_user!
  
  def index
    flash[:notice] = "Week 1 games have started - any roster changes now will take effect next week!"
    owner = User.find_owner_for_user(current_user)
    if owner.nil?
      puts "no Owner for that User"
    end
    @page_title = "#{owner.name}'s Roster"
    @players_by_status = FantasyPlayer.current_players_for_owner_by_status(owner)
  end
end
