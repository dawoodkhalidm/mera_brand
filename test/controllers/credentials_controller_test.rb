require 'test_helper'

class CredentialsControllerTest < ActionDispatch::IntegrationTest
  test "should get signup_costomer" do
    get credentials_signup_costomer_url
    assert_response :success
  end

  test "should get signup_brand_owner" do
    get credentials_signup_brand_owner_url
    assert_response :success
  end

  test "should get login" do
    get credentials_login_url
    assert_response :success
  end

end
