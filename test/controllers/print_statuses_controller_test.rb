require 'test_helper'

class PrintStatusesControllerTest < ActionController::TestCase
  setup do
    @print_status = print_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_status" do
    assert_difference('PrintStatus.count') do
      post :create, print_status: { description: @print_status.description, title: @print_status.title }
    end

    assert_redirected_to print_status_path(assigns(:print_status))
  end

  test "should show print_status" do
    get :show, id: @print_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_status
    assert_response :success
  end

  test "should update print_status" do
    patch :update, id: @print_status, print_status: { description: @print_status.description, title: @print_status.title }
    assert_redirected_to print_status_path(assigns(:print_status))
  end

  test "should destroy print_status" do
    assert_difference('PrintStatus.count', -1) do
      delete :destroy, id: @print_status
    end

    assert_redirected_to print_statuses_path
  end
end
