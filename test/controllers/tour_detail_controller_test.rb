require 'test_helper'

class TourDetailControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success, "get index without parameters"

    get :index,  tour_id: tours(:four).id
    assert_response :success, "get index with correct parameters"

    get :index,  tour_id: Tour.maximum("id") + 10
    assert_response :redirect, "get index with incorrect parameters"
  end

  test "should get deltour redirect html" do
    get :deltour
    assert_response :redirect
    assert_redirected_to tour_detail_index_path

  end

  test "should get deltour  ajax" do
    get :index, tour_id: tours(:four).id
    assert_response :success
    get :index, tour_id: tours(:five).id
    assert_response :success

    xhr :get, :deltour , tour: tours(:four).id, cur_tour: tours(:two).id

    assert_response :success
    assert_select_jquery :html, "#view_history" do
      assert_select 'ul', /MyString5/
    end

  end

end
