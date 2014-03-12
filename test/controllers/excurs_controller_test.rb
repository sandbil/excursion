require 'test_helper'

class ExcursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get display redirect html" do
    get :display
    assert_response :redirect
    assert_redirected_to excurs_index_path

  end

  test "should get display  ajax" do
    xhr :get, :display , page: 1, city: cities(:two).id

    assert_response :success
    assert_select_jquery :html, ".div_replace#{cities(:two).id}" do
         assert_select 'ul', /MyString4/
    end

  end


end
