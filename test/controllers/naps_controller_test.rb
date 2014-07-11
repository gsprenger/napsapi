require 'test_helper'

class NapsControllerTest < ActionController::TestCase
  setup do
    @nap = naps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:naps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nap" do
    assert_difference('Nap.count') do
      post :create, nap: { coordinates: @nap.coordinates, description: @nap.description, type: @nap.type }
    end

    assert_redirected_to nap_path(assigns(:nap))
  end

  test "should show nap" do
    get :show, id: @nap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nap
    assert_response :success
  end

  test "should update nap" do
    patch :update, id: @nap, nap: { coordinates: @nap.coordinates, description: @nap.description, type: @nap.type }
    assert_redirected_to nap_path(assigns(:nap))
  end

  test "should destroy nap" do
    assert_difference('Nap.count', -1) do
      delete :destroy, id: @nap
    end

    assert_redirected_to naps_path
  end
end
