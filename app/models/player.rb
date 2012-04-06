class Player < ActiveRecord::Base
  belongs_to :ultimate_team
  has_many :fantasy_players
  has_many :stats

  # Returns all the players who have a current matching FantasyPlayer
  def self.drafted
    drafted_players = []
    FantasyPlayer.current_players.each do |fantasy_player|
      drafted_players << Player.find(fantasy_player.player)
    end
    return drafted_players
  end
  
  def self.undrafted
    undrafted_players = Player.all - Player.drafted
  end
end
