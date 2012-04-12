require 'test_helper'

class FantasyPlayerTest < ActiveSupport::TestCase
  def setup
    @drafted_player = fantasy_players(:current_fantasy_player)
    @owner = owners(:one)
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

  test "current_players_for_owner_by_status returns a hash of 3 status" do
    players_hash = FantasyPlayer.current_players_for_owner_by_status(@owner)
    assert_equal players_hash.keys.length, 3
  end

  test "current_players_for_owner_by_status contains our known players" do
    players_hash = FantasyPlayer.current_players_for_owner_by_status(@owner)
    assert players_hash[nil].include? fantasy_players(:benched_fantasy_player)
    assert players_hash["1"].include? fantasy_players(:starting_fantasy_player)
    assert players_hash["2"].include? fantasy_players(:negative_fantasy_player)
  end
end
