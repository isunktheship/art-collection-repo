require 'test_helper'

class PrintPricePointsControllerTest < ActionController::TestCase
  setup do
    @print_price_point = print_price_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_price_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_price_point" do
    assert_difference('PrintPricePoint.count') do
      post :create, print_price_point: { average_price: @print_price_point.average_price, print_id: @print_price_point.print_id, six_month_average_price: @print_price_point.six_month_average_price }
    end

    assert_redirected_to print_price_point_path(assigns(:print_price_point))
  end

  test "should show print_price_point" do
    get :show, id: @print_price_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print_price_point
    assert_response :success
  end

  test "should update print_price_point" do
    patch :update, id: @print_price_point, print_price_point: { average_price: @print_price_point.average_price, print_id: @print_price_point.print_id, six_month_average_price: @print_price_point.six_month_average_price }
    assert_redirected_to print_price_point_path(assigns(:print_price_point))
  end

  test "should destroy print_price_point" do
    assert_difference('PrintPricePoint.count', -1) do
      delete :destroy, id: @print_price_point
    end

    assert_redirected_to print_price_points_path
  end
end
