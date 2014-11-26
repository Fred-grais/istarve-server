json.array!(@user_favorite_lists) do |user_favorite_list|
  json.extract! user_favorite_list, :id, :user_id, :restaurant_id
  json.url user_favorite_list_url(user_favorite_list, format: :json)
end
