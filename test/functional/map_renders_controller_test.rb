require 'test_helper'

class MapRendersControllerTest < ActionController::TestCase
  setup do
    @map_render = map_renders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:map_renders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create map_render" do
    assert_difference('MapRender.count') do
      post :create, :map_render => @map_render.attributes
    end

    assert_redirected_to map_render_path(assigns(:map_render))
  end

  test "should show map_render" do
    get :show, :id => @map_render.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @map_render.to_param
    assert_response :success
  end

  test "should update map_render" do
    put :update, :id => @map_render.to_param, :map_render => @map_render.attributes
    assert_redirected_to map_render_path(assigns(:map_render))
  end

  test "should destroy map_render" do
    assert_difference('MapRender.count', -1) do
      delete :destroy, :id => @map_render.to_param
    end

    assert_redirected_to map_renders_path
  end
end
