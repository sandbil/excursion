require 'test_helper'

class ToursControllerTest < ActionController::TestCase
  setup do
    @tour = tours(:tours_001)

    @update = {
        name: 'Экскурсия 1',
        description: 'Это тестовая экскурсия',
        public: true,
        price: 19.95,
        city_id: cities(:cities_001),
        category_id: categories(:categories_004)
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour" do
    assert_difference('Tour.count') do
      post :create, tour: @update

    end

    assert_redirected_to tour_path(assigns(:tour))
  end

  test "should show tour" do
    get :show, id: @tour
    assert_response :success
  end

  test "should show tour with public false" do

      tour = Tour.new(name: "example1", description: "Это тестовая экскурсия",
                      public: false,city_id: cities(:cities_001).id,  category_id: categories(:categories_005).id)
      tour.save!

    get :show, id: tour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour
    assert_response :success
  end

  test "should get edit with public false" do
    tour = Tour.new(name: "example1", description: "Это тестовая экскурсия",
                    public: false,city_id: cities(:cities_001).id,  category_id: categories(:categories_001).id)
    tour.save!

    get :edit, id: tour
    assert_response :success
  end

  test "should update tour" do
    patch :update, id: @tour, tour: @update

    assert_redirected_to tour_path(assigns(:tour))
  end

  test "should destroy tour" do
    assert_difference('Tour.count', -1) do
      delete :destroy, id: @tour
    end

    assert_redirected_to tours_path
  end

  test "should destroy tour with public false" do
    tour = Tour.new(name: "example1", description: "Это тестовая экскурсия",
                    public: false,city_id: cities(:cities_001).id,  category_id: categories(:categories_001).id)
    tour.save!

    assert_difference('Tour.unscoped.count', -1) do
      delete :destroy, id: tour
    end

    assert_redirected_to tours_path
  end
end
