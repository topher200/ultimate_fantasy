class Owner < ActiveRecord::Base
  has_many :fantasy_players

  # Returns a hash of owner => [players]
  def self.players_by_owner
    players_by_owner = {}
    FantasyPlayer.current_players.each do |fantasy_player|
      players_by_owner[fantasy_player.owner] ||= []
      players_by_owner[fantasy_player.owner] << fantasy_player.player
    end
    players_by_owner
  end
end
