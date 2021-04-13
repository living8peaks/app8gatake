require 'test_helper'

class LendFarmlandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lend_farmlands_index_url
    assert_response :success
  end

  test "should get show" do
    get lend_farmlands_show_url
    assert_response :success
  end

  test "should get new" do
    get lend_farmlands_new_url
    assert_response :success
  end

  test "should get edit" do
    get lend_farmlands_edit_url
    assert_response :success
  end

end
