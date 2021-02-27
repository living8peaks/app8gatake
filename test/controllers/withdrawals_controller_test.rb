require 'test_helper'

class WithdrawalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get withdrawals_new_url
    assert_response :success
  end

end
