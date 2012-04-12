require 'test_helper'

class FantasyPlayerTest < ActiveSupport::TestCase
  def setup
    @drafted_player = fantasy_players(:current_fantasy_player)
  end
  
  test "current_players only returns players that are current" do
    FantasyPlayer.current_players.each do |player|
      assert player.week == nil
    end
  end

  test "current_players returns our 1 current player" do
    assert_equal FantasyPlayer.current_players[0], @drafted_player
  end
end
