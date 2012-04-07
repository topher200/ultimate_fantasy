class DraftController < ApplicationController
  def index
    logger.debug "in draft::index"
    @players = Player.undrafted
    @owner_array = [["", 0]]
    Owner.all.each do |owner|
      @owner_array += [[owner.name, owner.id]]
    end
  end

  def draft
    logger.debug "in draft::draft"
    drafted_player = params[:player]
    new_owner = params[:new_owner]

    if drafted_player and new_owner
      f = FantasyPlayer.create!(:player => Player.find(drafted_player),
                                :owner => Owner.find(new_owner))
      flash[:notice] = "#{Player.find(drafted_player).name} was successfully
drafted to #{Owner.find(new_owner).name}."
    end

    redirect_to :action => 'index'
  end

end
