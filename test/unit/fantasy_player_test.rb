require 'test_helper'

class FantasyPlayerTest < ActiveSupport::TestCase
  test "only current players returned" do
    FantasyPlayer.current_players.each do | player |
      assert player.week == nil
    end
  end
end
