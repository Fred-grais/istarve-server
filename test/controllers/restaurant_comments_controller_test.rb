require 'test_helper'

class RestaurantCommentsControllerTest < ActionController::TestCase
  setup do
    @restaurant_comment = restaurant_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_comment" do
    assert_difference('RestaurantComment.count') do
      post :create, restaurant_comment: { body: @restaurant_comment.body, restaurant_id: @restaurant_comment.restaurant_id, title: @restaurant_comment.title, user_id: @restaurant_comment.user_id }
    end

    assert_redirected_to restaurant_comment_path(assigns(:restaurant_comment))
  end

  test "should show restaurant_comment" do
    get :show, id: @restaurant_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_comment
    assert_response :success
  end

  test "should update restaurant_comment" do
    patch :update, id: @restaurant_comment, restaurant_comment: { body: @restaurant_comment.body, restaurant_id: @restaurant_comment.restaurant_id, title: @restaurant_comment.title, user_id: @restaurant_comment.user_id }
    assert_redirected_to restaurant_comment_path(assigns(:restaurant_comment))
  end

  test "should destroy restaurant_comment" do
    assert_difference('RestaurantComment.count', -1) do
      delete :destroy, id: @restaurant_comment
    end

    assert_redirected_to restaurant_comments_path
  end
end
