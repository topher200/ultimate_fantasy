require 'test_helper'

class DraftControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
    @owner = owners(:one)
    sign_in
  end

  test "should get index" do
    get :index
    assert_response :success

    assert_not_nil assigns(:players)
  end

  test "should draft player" do
    assert_difference('FantasyPlayer.count') do
      post :draft, player: @player, new_owner: @owner
    end

    assert_redirected_to :controller => "draft", :action => "index"
  end
end
