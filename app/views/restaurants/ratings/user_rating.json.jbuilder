unless @restaurant_rating.blank?
  json.extract! @restaurant_rating, :rating, :created_at, :updated_at
  json.event :user_rating
end