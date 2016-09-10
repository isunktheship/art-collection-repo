require 'test_helper'

class SizesControllerTest < ActionController::TestCase
  setup do
    @print_size = sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_size" do
    assert_difference('PrintSize.count') do
      post :create, print_size: { height: @print_size.height, width: @print_size.width }
    end

    assert_redirected_to size_path(assigns(:print_size))
  end

  test "should show print_size" do
    get :show, id: @print_size
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_size
    assert_response :success
  end

  test "should update print_size" do
    patch :update, id: @print_size, print_size: { height: @print_size.height, width: @print_size.width }
    assert_redirected_to size_path(assigns(:print_size))
  end

  test "should destroy print_size" do
    assert_difference('PrintSize.count', -1) do
      delete :destroy, id: @print_size
    end

    assert_redirected_to sizes_path
  end
end
