json.array!(@restaurant_ratings) do |restaurant_rating|
  json.extract! restaurant_rating, :id, :rating, :restaurant_id, :user_identity, :updated_at
end
