require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  def setup
    @owner = owners(:one)
    @owned_player = players(:one)
  end

  test "players_by_owner returns known owner/player combo" do
    assert Owner.players_by_owner[@owner].include? @owned_player
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
end
