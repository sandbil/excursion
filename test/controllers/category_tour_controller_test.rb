require 'test_helper'

class CategoryTourControllerTest < ActionController::TestCase
  test "should get index without parameters" do
    get :index
    assert_response :redirect
  end

  test "should get index with correct parameters" do
    get :index,  city_id: cities(:one).id, category_id: categories(:one).id
    assert_response :success, "get index with correct parameters" + response.status.to_s
  end

  test "should get index with incorrect parameters" do
    get :index,  city_id: City.maximum("id") + 10, category_id: Category.maximum("id") + 10
    assert_response :redirect, "get index with incorrect parameters"  + response.status.to_s
  end


end
