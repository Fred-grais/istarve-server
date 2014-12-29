unless @restaurant_comment.blank?
  json.extract! @restaurant_comment, :title, :body, :created_at, :updated_at

end