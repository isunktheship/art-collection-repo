require 'test_helper'

class PrintsControllerTest < ActionController::TestCase
  setup do
    @print = prints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print" do
    assert_difference('Print.count') do
      post :create, print: { artist_id: @print.artist_id, artist_id: @print.artist_id, class_id: @print.class_id, eb_uid: @print.eb_uid, marking_id: @print.marking_id, original_price: @print.original_price, release_date: @print.release_date, run_size: @print.run_size, size_id: @print.size_id, status_id: @print.status_id, technique_id: @print.technique_id, title: @print.title }
    end

    assert_redirected_to print_path(assigns(:print))
  end

  test "should show print" do
    get :show, id: @print
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @print
    assert_response :success
  end

  test "should update print" do
    patch :update, id: @print, print: { artist_id: @print.artist_id, artist_id: @print.artist_id, class_id: @print.class_id, eb_uid: @print.eb_uid, marking_id: @print.marking_id, original_price: @print.original_price, release_date: @print.release_date, run_size: @print.run_size, size_id: @print.size_id, status_id: @print.status_id, technique_id: @print.technique_id, title: @print.title }
    assert_redirected_to print_path(assigns(:print))
  end

  test "should destroy print" do
    assert_difference('Print.count', -1) do
      delete :destroy, id: @print
    end

    assert_redirected_to prints_path
  end
end
