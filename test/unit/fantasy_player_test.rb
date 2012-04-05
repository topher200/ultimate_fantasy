require 'test_helper'

class FantasyPlayerTest < ActiveSupport::TestCase
  test "current players returned" do
    FantasyPlayer.current_players.each do | player |
      assert player.week == 0
    end
  end
end
