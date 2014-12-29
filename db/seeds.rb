# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
logger = Logger.new(STDOUT)
users = ['jean.pierre@gmail.com', 'delvian@hotmail.fr', 'android@android.fr', 'christian.loble@pmail.gr', 'claire.montfre@utt.fr']
comments = ['Splendid work you have here.', 'Nice Restaurant!', 'Cool, cool, cool', 'Awesome', 'Ate there, delicious', 'Love this place!', 'Best dishes in town!']
titles = ['My thoughts', 'Loved it', 'Best restaurant', 'Unbelievable', 'A must see', 'Miam', 'Good']
created_elems = 0
users.each do |email|
  unless User.find_by(email: email)
    User.create(email: email, password: 25874100, password_confirmation: 25874100, uid: email, provider: 'email')
  end
end
logger.debug(created_elems.to_s + ' Users seeded')


created_ratings = 0
created_comments = 0
Restaurant.all.each do |restaurant|
  5.times do
    u = User.find_by(email: users.sample)
    puts "restaurant:" + restaurant.id.to_s
    puts "user:" + u.id.to_s
    unless RestaurantRating.find_by(restaurant_id: restaurant.id, user_id: u.id)
      restaurant.ratings.create(rating: rand(1..5), user_id: u.id)
      created_ratings += 1
    end
    unless RestaurantComment.find_by(restaurant_id: restaurant.id, user_id: u.id)
      restaurant.comments.create(title: titles.sample, body: comments.sample, user_id: u.id)
      created_comments += 1
    end
  end
end
logger.debug(created_ratings.to_s + ' Restaurant Ratings seeded')
logger.debug(created_comments.to_s + ' Restaurant Comments seeded')