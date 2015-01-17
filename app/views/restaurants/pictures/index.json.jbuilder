json.pictures_url @restaurant_pictures do |restaurant_picture|
  json.extract! restaurant_picture, :small_format_url
end
json.event :pictures_url_list