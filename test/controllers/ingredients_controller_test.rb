require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ingredients_new_url
    assert_response :success
  end

  test "should get create" do
    get ingredients_create_url
    assert_response :success
  end

  test "should get update" do
    get ingredients_update_url
    assert_response :success
  end

  test "should get edit" do
    get ingredients_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get ingredients_destroy_url
    assert_response :success
  end

end
