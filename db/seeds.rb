# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
logger = Logger.new(STDOUT)
users = ['jean.pierre@gmail.com', 'delvian@hotmail.fr', 'android@android.fr', 'christian.loble@pmail.gr', 'claire.montfre@utt.fr']

created_elems = 0
users.each do |email|
  unless User.find_by(email: email)
    User.create(email: email, password: 25874100, password_confirmation: 25874100, uid: email, provider: 'email')
  end
end
logger.debug(created_elems.to_s + ' Users seeded')


created_elems = 0
Restaurant.all.each do |restaurant|
  5.times do
    u = User.find_by(email: users.sample)
    puts "restaurant:" + restaurant.id.to_s
    puts "user:" + u.id.to_s
    unless RestaurantRating.find_by(restaurant_id: restaurant.id, user_id: u.id)
      restaurant.ratings.create(rating: rand(1..5), user_id: u.id)
      created_elems += 1
    end
  end
end
logger.debug(created_elems.to_s + ' Restaurant Ratings seeded')