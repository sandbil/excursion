require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  setup do
    @city = cities(:three)
    @city_not_delete = cities(:one)
	@update = {:name => 'qwerty'}
	
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city" do
    assert_difference('City.count') do
      post :create, city: @update # { name: @city.name }
    end

    assert_redirected_to city_path(assigns(:city))
  end

  test "should show city" do
    get :show, id: @city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @city
    assert_response :success
  end

  test "should update city" do
    patch :update, id: @city, city: { name: @city.name }
	#put :update, :id => @product.to_param, :product => @update
    assert_redirected_to city_path(assigns(:city))
  end

  test "should destroy city" do
    assert_difference('City.count', -1) do
      delete :destroy, id: @city
    end

    assert_redirected_to cities_path
  end

  test "don't should destroy city" do
    assert_no_difference('City.count') do
      delete :destroy, id: @city_not_delete
    end

    assert_redirected_to cities_path
  end
end
