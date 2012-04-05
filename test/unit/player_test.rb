require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def setup
    @drafted_player = players(:one)
  end
  
  test "all drafted players are drafted" do
    Player.drafted.each do |player|
      assert (FantasyPlayer.current_players.find(player))
    end
  end
  
  test "all undrafted players are undrafted" do
    Player.undrafted.each do |player|
      assert (not FantasyPlayer.current_players.find_by_id(player.id))
    end
  end

  test "drafted player is drafted" do
    assert Player.drafted? @drafted_player
  end
end
