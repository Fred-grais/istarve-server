require 'test_helper'

class RestaurantRatingsControllerTest < ActionController::TestCase
  setup do
    @restaurant_rating = restaurant_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_rating" do
    assert_difference('RestaurantRating.count') do
      post :create, restaurant_rating: { rating: @restaurant_rating.rating, restaurant_id: @restaurant_rating.restaurant_id }
    end

    assert_redirected_to restaurant_rating_path(assigns(:restaurant_rating))
  end

  test "should show restaurant_rating" do
    get :show, id: @restaurant_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_rating
    assert_response :success
  end

  test "should update restaurant_rating" do
    patch :update, id: @restaurant_rating, restaurant_rating: { rating: @restaurant_rating.rating, restaurant_id: @restaurant_rating.restaurant_id }
    assert_redirected_to restaurant_rating_path(assigns(:restaurant_rating))
  end

  test "should destroy restaurant_rating" do
    assert_difference('RestaurantRating.count', -1) do
      delete :destroy, id: @restaurant_rating
    end

    assert_redirected_to restaurant_ratings_path
  end
end
