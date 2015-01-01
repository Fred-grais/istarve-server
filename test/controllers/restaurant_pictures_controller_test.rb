require 'test_helper'

class RestaurantPicturesControllerTest < ActionController::TestCase
  setup do
    @restaurant_picture = restaurant_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurant_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_picture" do
    assert_difference('RestaurantPicture.count') do
      post :create, restaurant_picture: { restaurant_id: @restaurant_picture.restaurant_id }
    end

    assert_redirected_to restaurant_picture_path(assigns(:restaurant_picture))
  end

  test "should show restaurant_picture" do
    get :show, id: @restaurant_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_picture
    assert_response :success
  end

  test "should update restaurant_picture" do
    patch :update, id: @restaurant_picture, restaurant_picture: { restaurant_id: @restaurant_picture.restaurant_id }
    assert_redirected_to restaurant_picture_path(assigns(:restaurant_picture))
  end

  test "should destroy restaurant_picture" do
    assert_difference('RestaurantPicture.count', -1) do
      delete :destroy, id: @restaurant_picture
    end

    assert_redirected_to restaurant_pictures_path
  end
end
