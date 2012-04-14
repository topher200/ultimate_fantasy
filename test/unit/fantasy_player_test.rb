require 'test_helper'

class FantasyPlayerTest < ActiveSupport::TestCase
  def setup
    @drafted_fantasy_player = fantasy_players(:current_fantasy_player)
    @owner = owners(:one)
    @week_one_fantasy_player = fantasy_players(:week_one_fantasy_player)
    @benched_fantasy_player = fantasy_players(:benched_fantasy_player)
    @starting_fantasy_player = fantasy_players(:starting_fantasy_player)
    @negative_fantasy_player = fantasy_players(:negative_fantasy_player)
  end

  test "current_players only returns players that are current" do
    FantasyPlayer.current_players.each do |player|
      assert player.week == nil
    end
  end

  test "current_players includes our known current player" do
    assert FantasyPlayer.current_players.include? @drafted_fantasy_player
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
    assert players_hash[FantasyPlayer::BENCH].include? @benched_fantasy_player
    assert players_hash[FantasyPlayer::START].include? @starting_fantasy_player
    assert players_hash[FantasyPlayer::NEGATIVE].include? @negative_fantasy_player
  end

  test "change_status fails if given a player who's already played" do
    assert_equal FantasyPlayer.change_status(@week_one_fantasy_player, nil), false
  end

  test "change_status fails if given a 7th player to start" do
    # TODO(topher)
  end

  test "change_status fails if given a 2nd negative player" do
    player = FantasyPlayer.new(:player => players(:undrafted),
                               :owner => owners(:one))
    assert_equal FantasyPlayer.change_status(player, "2"), false
    player.destroy
  end

  test "change_status successfully changes the status of a player" do
    player = FantasyPlayer.new(:player => players(:undrafted),
                               :owner => owners(:two))
    FantasyPlayer.change_status(player, FantasyPlayer::BENCH)
    assert_equal player.status, nil
    FantasyPlayer.change_status(player, FantasyPlayer::START)
    assert_equal player.status, 1
    FantasyPlayer.change_status(player, FantasyPlayer::NEGATIVE)
    assert_equal player.status, 2
    player.destroy
  end
end
