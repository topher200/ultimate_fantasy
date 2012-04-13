class FantasyPlayer < ActiveRecord::Base
  belongs_to :owner
  belongs_to :player
  has_many :stats, :through => :player

  BENCH = nil
  START = "1"
  NEGATIVE = "2"
  STATUSES = [BENCH, START, NEGATIVE]

  def self.current_players
    self.where(:week => nil)
  end

  # Returns a hash of (status => fantasy_players).
  def self.current_players_for_owner_by_status(owner)
    players_by_status = {}
    STATUSES.each do |status|
      players_by_status[status] = self.where(:week => nil, :owner_id => owner,
                                             :status => status)
    end
    players_by_status
  end

  # Returns true if able to change status
  def self.change_status(fantasy_player, status)
    # can't change the status of someone after they've played
    if (fantasy_player.week != nil)
      return false
    end

    # TODO(topher): add confirmation that user is owner of fantasy player

    # Make sure this doesn't put us over a roster limit
    owner = fantasy_player.owner
    if (status == START) and Owner.has_max_starters?(owner)
      return false
    elsif (status == NEGATIVE) and Owner.has_max_negative?(owner)
      return false
    end

    # We're good!
    fantasy_player.status = status
    fantasy_player.save
  end
end
