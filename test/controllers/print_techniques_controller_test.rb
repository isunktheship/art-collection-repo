require 'test_helper'

class PrintTechniquesControllerTest < ActionController::TestCase
  setup do
    @print_technique = print_techniques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_techniques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_technique" do
    assert_difference('PrintTechnique.count') do
      post :create, print_technique: { description: @print_technique.description, title: @print_technique.title }
    end

    assert_redirected_to print_technique_path(assigns(:print_technique))
  end

  test "should show print_technique" do
    get :show, id: @print_technique
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_technique
    assert_response :success
  end

  test "should update print_technique" do
    patch :update, id: @print_technique, print_technique: { description: @print_technique.description, title: @print_technique.title }
    assert_redirected_to print_technique_path(assigns(:print_technique))
  end

  test "should destroy print_technique" do
    assert_difference('PrintTechnique.count', -1) do
      delete :destroy, id: @print_technique
    end

    assert_redirected_to print_techniques_path
  end
end
