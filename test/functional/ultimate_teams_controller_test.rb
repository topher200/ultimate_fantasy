require 'test_helper'

class UltimateTeamsControllerTest < ActionController::TestCase
  setup do
    @ultimate_team = ultimate_teams(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ultimate_teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ultimate_team" do
    assert_difference('UltimateTeam.count') do
      post :create, ultimate_team: @ultimate_team.attributes
    end

    assert_redirected_to ultimate_team_path(assigns(:ultimate_team))
  end

  test "should show ultimate_team" do
    get :show, id: @ultimate_team.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ultimate_team.to_param
    assert_response :success
  end

  test "should update ultimate_team" do
    put :update, id: @ultimate_team.to_param, ultimate_team: @ultimate_team.attributes
    assert_redirected_to ultimate_team_path(assigns(:ultimate_team))
  end

  test "should destroy ultimate_team" do
    assert_difference('UltimateTeam.count', -1) do
      delete :destroy, id: @ultimate_team.to_param
    end

    assert_redirected_to ultimate_teams_path
  end
end
