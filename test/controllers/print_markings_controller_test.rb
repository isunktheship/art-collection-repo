require 'test_helper'

class PrintMarkingsControllerTest < ActionController::TestCase
  setup do
    @print_marking = print_markings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_markings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_marking" do
    assert_difference('PrintMarking.count') do
      post :create, print_marking: { description: @print_marking.description, title: @print_marking.title }
    end

    assert_redirected_to print_marking_path(assigns(:print_marking))
  end

  test "should show print_marking" do
    get :show, id: @print_marking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_marking
    assert_response :success
  end

  test "should update print_marking" do
    patch :update, id: @print_marking, print_marking: { description: @print_marking.description, title: @print_marking.title }
    assert_redirected_to print_marking_path(assigns(:print_marking))
  end

  test "should destroy print_marking" do
    assert_difference('PrintMarking.count', -1) do
      delete :destroy, id: @print_marking
    end

    assert_redirected_to print_markings_path
  end
end
