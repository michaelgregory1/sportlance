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
john = User.create(email: "john@swim.com", password: "123456", first_name: 'John', last_name: 'Doe', sport: 'swimming', price_per_hour: 12, abilities_taught: "beginner", is_client: false)
mary = User.create(email: "Mary@swim.com", password: "123456", first_name: 'Mary', last_name: 'Meister', is_client: true)
cassie = User.create(email: "cassie@swim.com", password: "123456", first_name: 'Cassie', last_name: 'Doe', sport: 'yoga', price_per_hour: 50, abilities_taught: "beginner", is_client: false)
james = User.create(email: "james@swim.com", password: "123456", first_name: 'James', last_name: 'Dan', sport: 'strength', price_per_hour: 50, abilities_taught: "beginner", is_client: false)
adrian = User.create(email: "adrian@swim.com", password: "123456", first_name: 'Adrian', last_name: 'Dan', sport: 'strength', price_per_hour: 50, abilities_taught: "beginner", is_client: false)
ben = User.create(email: "ben@swim.com", password: "123456", first_name: 'Ben', last_name: 'Stan', sport: 'strength', price_per_hour: 50, abilities_taught: "beginner", is_client: false)
adam = User.create(email: "adam@swim.com", password: "123456", first_name: 'Adam', last_name: 'Stan', sport: 'strength', price_per_hour: 50, abilities_taught: "beginner", is_client: false)


john.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799972/test01.jpg"
john.save
mary.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799963/test02.jpg"
mary.save
cassie.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970012/train1.jpg"
cassie.save
james.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970013/traine2.jpg"
james.save
adrian.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970012/traine3.jpg"
adrian.save
ben.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970012/traine4.jpg"
ben.save
adam.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970011/traine5.jpg"
adam.save




puts 'Creating Location'
greenwich = Location.create(address: "King William Walk, London SE10 9HT", user_id: john.id)
greenwich = Location.create(address: "King William Walk, London SE10 9HT", user_id: cassie.id)
greenwich = Location.create(address: "King William Walk, London SE10 9HT", user_id: adrian.id)
greenwich = Location.create(address: "King William Walk, London SE10 9HT", user_id: ben.id)
greenwich = Location.create(address: "King William Walk, London SE10 9HT", user_id: adam.id)
pimlico = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: john.id)
pimlico = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: cassie.id)
pimlico = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: adrian.id)
pimlico = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: ben.id)
pimlico = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: james.id)
hammersmith = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: cassie.id)
hammersmith = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: james.id)
hammersmith = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: ben.id)
hammersmith = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: adrian.id)
hammersmith = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: john.id)
kensington = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: james.id)
kensington = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: cassie.id)
kensington = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: adrian.id)
kensington = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: ben.id)
kensington = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: john.id)


puts 'Creating booking'
Booking.create(user_id: john.id, client_id: mary.id, date_start: "2018-11-21 13:00:00", date_end: "2018-11-21 14:00:00", location_id: greenwich.id)
Booking.create(user_id: cassie.id, client_id: mary.id, date_start: "2018-11-21 11:00:00", date_end: "2018-11-21 12:00:00", location_id: hammersmith.id)
Booking.create(user_id: james.id, client_id: mary.id, date_start: "2018-11-21 11:00:00", date_end: "2018-11-21 12:00:00", location_id: kensington.id)


puts 'Finished'
