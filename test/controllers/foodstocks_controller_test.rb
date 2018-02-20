require 'test_helper'

class FoodstocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foodstock = foodstocks(:one)
  end

  test "should get index" do
    get foodstocks_url
    assert_response :success
  end

  test "should get new" do
    get new_foodstock_url
    assert_response :success
  end

  test "should create foodstock" do
    assert_difference('Foodstock.count') do
      post foodstocks_url, params: { foodstock: { article: @foodstock.article, beforedate: @foodstock.beforedate, buyingdate: @foodstock.buyingdate, quantity: @foodstock.quantity } }
    end

    assert_redirected_to foodstock_url(Foodstock.last)
  end

  test "should show foodstock" do
    get foodstock_url(@foodstock)
    assert_response :success
  end

  test "should get edit" do
    get edit_foodstock_url(@foodstock)
    assert_response :success
  end

  test "should update foodstock" do
    patch foodstock_url(@foodstock), params: { foodstock: { article: @foodstock.article, beforedate: @foodstock.beforedate, buyingdate: @foodstock.buyingdate, quantity: @foodstock.quantity } }
    assert_redirected_to foodstock_url(@foodstock)
  end

  test "should destroy foodstock" do
    assert_difference('Foodstock.count', -1) do
      delete foodstock_url(@foodstock)
    end

    assert_redirected_to foodstocks_url
  end
end
