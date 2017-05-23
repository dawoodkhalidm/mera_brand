require 'test_helper'

class AddProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get add_product_index_url
    assert_response :success
  end

  test "should get view_products" do
    get add_product_view_products_url
    assert_response :success
  end

end
