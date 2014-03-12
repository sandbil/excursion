require 'test_helper'

class CityTourControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :redirect

    get :index,  city_id: cities(:one).id
    assert_response :success, "get index with correct parameters" + response.status.to_s

    get :index,  city_id: City.maximum("id") + 10
    assert_response :redirect, "get index with incorrect parameters"  + response.status.to_s
  end

end
