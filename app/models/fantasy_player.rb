class FantasyPlayer < ActiveRecord::Base
  belongs_to :owner
  belongs_to :player
  has_many :stats, :through => :player

  def self.current_players
    self.where(:week => nil)
  end
end
