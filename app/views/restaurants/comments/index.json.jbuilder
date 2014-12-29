json.comments @restaurant_comments do |restaurant_comment|
  json.extract! restaurant_comment, :id, :title, :body, :restaurant_id, :user_identity, :displayed_date
end
json.event :comments_list