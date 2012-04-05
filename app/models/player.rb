class Player < ActiveRecord::Base
  belongs_to :ultimate_team
  has_many :fantasy_players
  has_many :stats

  # Returns all the players who have a current matching FantasyPlayer
  def self.drafted
    FantasyPlayer.current_players.each do |fantasy_player|
      Player.find fantasy_player.player
    end
  end
  
  def self.undrafted
    undrafted_players = Player.all - Player.drafted
  end

  # Returns true if there is a current matching FantasyPlayer
  def self.drafted?(player)
    FantasyPlayer.current_players.find_by_id(player.id) != nil
  end
end
