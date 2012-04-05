class DraftController < ApplicationController
  def index
    puts "in draft::index"
    @players = Player.all
  end

  def draft
    puts "in draft::draft"
    drafted_player = params[:player]
    new_owner = params[:new_owner]

    puts "drafted_player #{drafted_player}"
    puts "new_owner #{new_owner}"
    if drafted_player and new_owner
      f = FantasyPlayer.create!(:player => Player.find(drafted_player),
                                :owner => Owner.find(new_owner))
      puts "player #{f.player.name}"
      flash[:notice] = "#{Player.find(drafted_player).name} was successfully
drafted to #{Owner.find(new_owner).name}."
    end

    redirect_to :action => 'index'
  end

end
