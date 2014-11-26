json.array!(@restaurant_comments) do |restaurant_comment|
  json.extract! restaurant_comment, :id, :title, :body, :restaurant_id, :user_id
  json.url restaurant_comment_url(restaurant_comment, format: :json)
end
