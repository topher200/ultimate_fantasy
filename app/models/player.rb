class Player < ActiveRecord::Base
  belongs_to :ultimate_team
  has_many :fantasy_players
end
