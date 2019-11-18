require 'test_helper'

class FavouriteFoodsControllerTest < ActionController::TestCase
  setup do
    @favourite_food = favourite_foods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favourite_foods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favourite_food" do
    assert_difference('FavouriteFood.count') do
      post :create, favourite_food: @favourite_food.attributes
    end

    assert_redirected_to favourite_food_path(assigns(:favourite_food))
  end

  test "should show favourite_food" do
    get :show, id: @favourite_food
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favourite_food
    assert_response :success
  end

  test "should update favourite_food" do
    put :update, id: @favourite_food, favourite_food: @favourite_food.attributes
    assert_redirected_to favourite_food_path(assigns(:favourite_food))
  end

  test "should destroy favourite_food" do
    assert_difference('FavouriteFood.count', -1) do
      delete :destroy, id: @favourite_food
    end

    assert_redirected_to favourite_foods_path
  end
end
