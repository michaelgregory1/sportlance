# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating Users'
john = User.create(email: "john@swim.com", password: "123456", first_name: 'John', last_name: 'Doe', sport: 'swimming', price_per_hour: 12, abilities_taught: "beginner", is_client: false)
mary = User.create(email: "Mary@swim.com", password: "123456", first_name: 'Mary', last_name: 'Meister', is_client: true)


john.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799972/test01.jpg"
john.save
mary.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799963/test02.jpg"
mary.save

puts 'Creating Location'
greenwich = Location.create(address: "King William Walk, London SE10 9HT", user_id: john.id)
pimlico = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: john.id)
soho = Location.create(address: "67 Brewer St, Soho, London W1F 9US", user_id: john.id)

puts 'Creating booking'
Booking.create(user_id: john.id, client_id: mary.id, date_start: "2018-11-21 13:00:00", date_end: "2018-11-21 14:00:00", location_id: greenwich.id)

puts 'Finished'
