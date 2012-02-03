require 'test_helper'

class CruisesControllerTest < ActionController::TestCase
  setup do
    @cruise = cruises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cruises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cruise" do
    assert_difference('Cruise.count') do
      post :create, cruise: @cruise.attributes
    end

    assert_redirected_to cruise_path(assigns(:cruise))
  end

  test "should show cruise" do
    get :show, id: @cruise.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cruise.to_param
    assert_response :success
  end

  test "should update cruise" do
    put :update, id: @cruise.to_param, cruise: @cruise.attributes
    assert_redirected_to cruise_path(assigns(:cruise))
  end

  test "should destroy cruise" do
    assert_difference('Cruise.count', -1) do
      delete :destroy, id: @cruise.to_param
    end

    assert_redirected_to cruises_path
  end
end
