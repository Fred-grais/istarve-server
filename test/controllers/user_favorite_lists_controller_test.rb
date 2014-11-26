require 'test_helper'

class UserFavoriteListsControllerTest < ActionController::TestCase
  setup do
    @user_favorite_list = user_favorite_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_favorite_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_favorite_list" do
    assert_difference('UserFavoriteList.count') do
      post :create, user_favorite_list: { restaurant_id: @user_favorite_list.restaurant_id, user_id: @user_favorite_list.user_id }
    end

    assert_redirected_to user_favorite_list_path(assigns(:user_favorite_list))
  end

  test "should show user_favorite_list" do
    get :show, id: @user_favorite_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_favorite_list
    assert_response :success
  end

  test "should update user_favorite_list" do
    patch :update, id: @user_favorite_list, user_favorite_list: { restaurant_id: @user_favorite_list.restaurant_id, user_id: @user_favorite_list.user_id }
    assert_redirected_to user_favorite_list_path(assigns(:user_favorite_list))
  end

  test "should destroy user_favorite_list" do
    assert_difference('UserFavoriteList.count', -1) do
      delete :destroy, id: @user_favorite_list
    end

    assert_redirected_to user_favorite_lists_path
  end
end
