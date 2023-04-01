require "test_helper"

class PrivateroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get privaterooms_show_url
    assert_response :success
  end

  test "should get new" do
    get privaterooms_new_url
    assert_response :success
  end

  test "should get create" do
    get privaterooms_create_url
    assert_response :success
  end
end
