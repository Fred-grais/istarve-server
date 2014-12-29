unless @restaurant_rating.blank?
  json.extract! @restaurant_rating, :rating, :created_at, :updated_at
end