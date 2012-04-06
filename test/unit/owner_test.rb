require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  def setup
    @owner = owners(:one)
    @player = players(:one)
  end

  test "known owner/player combo is in players_by_owner" do
    assert Owner.players_by_owner[@owner].include? @player
  end
end
