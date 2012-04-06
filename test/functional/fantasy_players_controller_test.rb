require 'test_helper'

class FantasyPlayersControllerTest < ActionController::TestCase
  setup do
    @fantasy_player = fantasy_players(:current_fantasy_player)
    sign_in
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fantasy_players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fantasy_player" do
    assert_difference('FantasyPlayer.count') do
      post :create, fantasy_player: @fantasy_player.attributes
    end

    assert_redirected_to fantasy_player_path(assigns(:fantasy_player))
  end

  test "should show fantasy_player" do
    get :show, id: @fantasy_player.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fantasy_player.to_param
    assert_response :success
  end

  test "should update fantasy_player" do
    put :update, id: @fantasy_player.to_param, fantasy_player: @fantasy_player.attributes
    assert_redirected_to fantasy_player_path(assigns(:fantasy_player))
  end

  test "should destroy fantasy_player" do
    assert_difference('FantasyPlayer.count', -1) do
      delete :destroy, id: @fantasy_player.to_param
    end

    assert_redirected_to fantasy_players_path
  end
end
