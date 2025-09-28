require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get change" do
    get passwords_change_url
    assert_response :success
  end

  test "should get update" do
    get passwords_update_url
    assert_response :success
  end
end
