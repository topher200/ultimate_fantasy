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
    if (fantasy_player.week != nil)
      # can't change the status of someone after they've played
      return false
    end
    current_roster = self.current_players_for_owner_by_status(fantasy_player.owner)
    if (status == START)
      # can only have 6 starters
      if current_roster[START].length >= 6
        return false
      end
    elsif (status == NEGATIVE)
      # can only have one negative
      if current_roster[NEGATIVE].length >= 1
        return false
      end
    end
    fantasy_player.status = status
    fantasy_player.save
  end
end
