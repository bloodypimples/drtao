require 'test_helper'

class SuperCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get super_categories_show_url
    assert_response :success
  end

end
