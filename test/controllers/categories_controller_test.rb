require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:categories_005)
	@category_delete = categories(:categories_003)
    @category_not_delete = categories(:categories_001)
    @update = {:name => 'qwerty'}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: @update # { name: @category.name }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category_delete
    end

    assert_redirected_to categories_path
  end

  test "don't should destroy category" do
    assert_no_difference('Category.count') do
      delete :destroy, id: @category_not_delete
    end

    assert_redirected_to categories_path
  end
end
