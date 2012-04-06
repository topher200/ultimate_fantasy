require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def setup
    @drafted_player = players(:one)
    @undrafted_player = players(:undrafted)
  end

  test "all players in drafted list are drafted" do
    Player.drafted.each do |player|
      assert (FantasyPlayer.current_players.where(:player => player))
    end
  end

  test "known drafted player is returned in the list of drafted players" do
    assert Player.drafted.include?(@drafted_player),
    "drafted player list #{Player.drafted} doesn't include " +
      "known drafted player #{@drafted_player}"
  end

  test "no players in undrafted list are on a team" do
    Player.undrafted.each do |player|
      assert_nil FantasyPlayer.current_players.find_by_id(player.id)
    end
  end

  test "our undrafted player is in undrafted list" do
    assert Player.undrafted.include? @undrafted_player
  end

  test "our undrafted player is in not in drafted list" do
    assert (not Player.drafted.include? @undrafted_player)
  end
end
