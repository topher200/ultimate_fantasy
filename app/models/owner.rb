class Owner < ActiveRecord::Base
  has_many :fantasy_players
  belongs_to :user

  # Returns a hash of owner => [players]
  def self.players_by_owner
    players_by_owner = {}
    Owner.all.each do |owner|
      players_by_owner[owner] = []
    end
    FantasyPlayer.current_players.each do |fantasy_player|
      players_by_owner[fantasy_player.owner] << fantasy_player.player
    end
    players_by_owner
  end

  def self.has_max_starters?(owner)
    players = FantasyPlayer.current_players_for_owner_by_status(owner)
    starters = players[FantasyPlayer::START]
    starters.length >= 6
  end
end
