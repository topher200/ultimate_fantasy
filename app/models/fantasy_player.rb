class FantasyPlayer < ActiveRecord::Base
  belongs_to :owner
  belongs_to :player
end
