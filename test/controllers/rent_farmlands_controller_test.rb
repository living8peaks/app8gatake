require 'test_helper'

class RentFarmlandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rent_farmlands_index_url
    assert_response :success
  end

  test "should get show" do
    get rent_farmlands_show_url
    assert_response :success
  end

  test "should get new" do
    get rent_farmlands_new_url
    assert_response :success
  end

  test "should get edit" do
    get rent_farmlands_edit_url
    assert_response :success
  end

end
