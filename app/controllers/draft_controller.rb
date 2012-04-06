class DraftController < ApplicationController
  def index
    puts "in draft::index"
    @players = Player.undrafted
    @owner_array = []
    Owner.all.each do |owner|
      @owner_array += [[owner.name, owner.id]]
    end
  end

  def draft
    puts "in draft::draft"
    drafted_player = params[:player]
    new_owner = params[:new_owner]

    puts "in drafted_player #{drafted_player}"
    puts "in new_owner #{new_owner}"
    puts "in new_owner.name #{Owner.find(new_owner).name}"
    if drafted_player and new_owner
      f = FantasyPlayer.create!(:player => Player.find(drafted_player),
                                :owner => Owner.find(new_owner))
      puts "in player #{f.player.name}"
      flash[:notice] = "#{Player.find(drafted_player).name} was successfully
drafted to #{Owner.find(new_owner).name}."
    end

    redirect_to :action => 'index'
  end

end
