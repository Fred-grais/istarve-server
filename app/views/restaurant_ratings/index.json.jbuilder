json.array!(@restaurant_ratings) do |restaurant_rating|
  json.extract! restaurant_rating, :id, :rating, :restaurant_id
  json.url restaurant_rating_url(restaurant_rating, format: :json)
end
