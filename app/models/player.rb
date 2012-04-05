class Player < ActiveRecord::Base
  belongs_to :ultimate_team
  has_many :fantasy_players
  has_many :stats

  def self.undrafted
    FantasyPlayer.all - FantasyPlayer.current_players
  end
end
