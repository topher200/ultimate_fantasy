require 'test_helper'

class FantasyPlayerTest < ActiveSupport::TestCase
  def setup
    @drafted_player = fantasy_players(:current_fantasy_player)
  end
  
  test "only current players returned" do
    FantasyPlayer.current_players.each do | player |
      assert player.week == nil
    end
  end

  test "our 1 current player is returned in current player list" do
    assert_equal @drafted_player, FantasyPlayer.current_players[0]
  end
end
