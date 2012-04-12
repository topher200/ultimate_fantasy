require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @admin_user = users(:admin)
  end

  test "owner returns the correct owner" do
    owner = User.find_owner_for_user(@admin_user)
    assert_equal owner.user, @admin_user
  end
end
