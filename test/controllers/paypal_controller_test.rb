require 'test_helper'

class PaypalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paypal_index_url
    assert_response :success
  end

end
