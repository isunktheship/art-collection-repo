require 'test_helper'

class PrintClassesControllerTest < ActionController::TestCase
  setup do
    @print_class = print_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_class" do
    assert_difference('PrintClass.count') do
      post :create, print_class: { description: @print_class.description, title: @print_class.title }
    end

    assert_redirected_to print_class_path(assigns(:print_class))
  end

  test "should show print_class" do
    get :show, id: @print_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_class
    assert_response :success
  end

  test "should update print_class" do
    patch :update, id: @print_class, print_class: { description: @print_class.description, title: @print_class.title }
    assert_redirected_to print_class_path(assigns(:print_class))
  end

  test "should destroy print_class" do
    assert_difference('PrintClass.count', -1) do
      delete :destroy, id: @print_class
    end

    assert_redirected_to print_classes_path
  end
end
