require 'test_helper'

class DraftControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

    assert_not_nil assigns(:players)
  end
end
