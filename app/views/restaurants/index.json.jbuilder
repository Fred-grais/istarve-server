json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :lat, :lon, :type_id
  json.url restaurant_url(restaurant, format: :json)
end
