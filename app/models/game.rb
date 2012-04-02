class Game < ActiveRecord::Base
  belongs_to :home_team, :class_name => "UltimateTeam"
  belongs_to :away_team, :class_name => "UltimateTeam"
end
