class FantasyPlayer < ActiveRecord::Base
  belongs_to :owner
  belongs_to :player
  has_many :stats, :through => :player

  def self.current_players
    self.where(:week => nil)
  end

  # Returns a hash of (status => fantasy_players).
  def self.current_players_for_owner_by_status(owner)
    players_by_status = {}
    ["0", "1", "2"].each do |status|
      players_by_status[status] = self.where(:week => nil, :owner_id => owner,
                                             :status => status.to_i)
    end
    players_by_status
  end
end
