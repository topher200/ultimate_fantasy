require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  def setup
    @owner_with_players = owners(:one)
    @owner_without_players = owners(:two)
    @owned_player = players(:one)
  end

  test "players_by_owner returns known owner/player combo" do
    assert Owner.players_by_owner[@owner_with_players].include? @owned_player
  end

  test "players_by_owner returns every owner" do
    assert_equal Owner.all.sort, Owner.players_by_owner.keys.sort
  end

  test "players_by_owner returns the exact list of current players" do
    players_from_owners = []
    Owner.players_by_owner.values.each do |player_list|
      player_list.each do |player|
        players_from_owners << player
      end
    end
    players_from_fantasy_list = []
    FantasyPlayer.current_players.each do |fantasy_player|
      players_from_fantasy_list << fantasy_player.player
    end
    assert_equal players_from_fantasy_list.sort, players_from_owners.sort
  end

  test "has_max_starters? returns false with little starters" do
    assert_equal Owner.has_max_starters?(@owner_with_players), false
  end

  test "has_max_negative? returns true with one negative" do
    assert Owner.has_max_negative?(@owner_with_players)
  end

  test "has_max_negative? returns false with zero negatives" do
    assert_equal Owner.has_max_negative?(@owner_without_players), false
  end
end
