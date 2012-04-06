require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_redirected_to :controller => "players", :action => "index"
  end

end
