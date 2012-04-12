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

  test "current_players includes our known current player" do
    assert FantasyPlayer.current_players.include? @drafted_player
  end
  
  test "current_players returns our 4 current players" do
    assert_equal FantasyPlayer.current_players.length, 4
  end
end
