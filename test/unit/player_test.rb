require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test "all undrafted players are undrafted" do
    Player.undrafted.each do |player|
      assert (not FantasyPlayer.current_players.find_by_id(player.id))
    end
  end
end
