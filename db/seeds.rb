# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
User.destroy_all

puts 'Creating Users'
john = User.create(email: "john@swim.com", password: "123456", first_name: 'John', last_name: 'Watson', sport: 'swimming', price_per_hour: 40, abilities_taught: "beginner", is_client: false)
paul = User.create(email: "paul@swim.com", password: "123456", first_name: 'paul', last_name: 'Eadie', sport: 'swimming', price_per_hour: 55, abilities_taught: "advanced", is_client: false)
cassie = User.create(email: "cassie@swim.com", password: "123456", first_name: 'Cassie', last_name: 'Dover', sport: 'yoga', price_per_hour: 30, abilities_taught: "beginner", is_client: false)
james = User.create(email: "james@swim.com", password: "123456", first_name: 'James', last_name: 'David', sport: 'strength', price_per_hour: 45, abilities_taught: "intermediate", is_client: false)
adrian = User.create(email: "adrian@swim.com", password: "123456", first_name: 'Adrian', last_name: 'Young', sport: 'strength', price_per_hour: 65, abilities_taught: "advanced", is_client: false)
ben = User.create(email: "ben@swim.com", password: "123456", first_name: 'Ben', last_name: 'Peel', sport: 'running', price_per_hour: 50, abilities_taught: "beginner", is_client: false)
adam = User.create(email: "adam@swim.com", password: "123456", first_name: 'Adam', last_name: 'Stanley', sport: 'running', price_per_hour: 35, abilities_taught: "beginner", is_client: false)

john.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799972/train8.jpg"
john.save
paul.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799972/train7.jpg"
paul.save
cassie.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970012/train1.jpg"
cassie.save
james.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970013/train9.jpg"
james.save
adrian.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970012/train6.jpg"
adrian.save
ben.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970012/train4.jpg"
ben.save
adam.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970011/train5.jpg"
adam.save

puts 'Creating clients'
mary = User.create(email: "mary@swim.com", password: "123456", first_name: 'Mary', last_name: 'Meister', is_client: true)
georgia = User.create(email: "georgia@swim.com", password: "123456", first_name: 'georgia', last_name: 'Smith', is_client: true)

mary.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799963/train2.jpg"
mary.save
georgia.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799963/train3.jpg"
georgia.save

puts 'Creating Location'
greenwich1 = Location.create(address: "King William Walk, London SE10 9HT", user_id: john.id)
greenwich2 = Location.create(address: "5B Greenwich Market, London SE10 9HZ", user_id: cassie.id)
greenwich3 = Location.create(address: "178 Greenwich High Rd, London SE10 8NN", user_id: adrian.id)
greenwich4 = Location.create(address: "56 Royal Hill, Greenwich, London SE10 8RT", user_id: ben.id)
greenwich5 = Location.create(address: "11 Victoria Parade, London SE10 9FR", user_id: adam.id)

pimlico1 = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: john.id)
pimlico2 = Location.create(address: "Lupus St, Pimlico, London SW1V 3AT", user_id: cassie.id)
pimlico3 = Location.create(address: "52 Cambridge St, Pimlico, London SW1V 4QQ", user_id: adrian.id)

hammersmith1 = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: paul.id)
hammersmith2 = Location.create(address: "Hammersmith Rd, Hammersmith, London W14 8UX", user_id: james.id)
hammersmith3 = Location.create(address: "Palliser Rd, Hammersmith, London W14 9EQ", user_id: ben.id)
hammersmith4 = Location.create(address: "Normand Park, Lillie Rd, Fulham Pools, London SW6 7ST", user_id: adam.id)
hammersmith5 = Location.create(address: "373 Lillie Rd, Hammersmith, London SW6 7PD", user_id: john.id)

kensington1 = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: james.id)
kensington2 = Location.create(address: "11A Stratford Rd, Kensington, London W8 6RF", user_id: cassie.id)
kensington3 = Location.create(address: "254 Road, Earls Court, London SW5 9AD", user_id: adrian.id)
kensington4 = Location.create(address: "45 Phillimore Walk, Kensington, London W8 7RZ", user_id: paul.id)
kensington5 = Location.create(address: "58-60 Kensington Church St, Kensington, London W8 4DB", user_id: ben.id)

# puts 'Creating booking'
# Booking.create(user_id: john.id, client_id: mary.id, date_start: "2018-11-21 13:00:00", date_end: "2018-11-21 14:00:00", location_id: greenwich.id)
# Booking.create(user_id: cassie.id, client_id: mary.id, date_start: "2018-11-21 11:00:00", date_end: "2018-11-21 12:00:00", location_id: hammersmith.id)
# Booking.create(user_id: james.id, client_id: mary.id, date_start: "2018-11-21 11:00:00", date_end: "2018-11-21 12:00:00", location_id: kensington.id)

puts 'Finished'
