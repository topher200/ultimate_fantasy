require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_redirected_to :controller => "owners", :action => "index"
  end

end
