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
paul = User.create(email: "paul@swim.com", password: "123456", first_name: 'Paul', last_name: 'Eadie', sport: 'swimming', price_per_hour: 55, abilities_taught: "advanced", is_client: false)
cassie = User.create(email: "cassie@swim.com", password: "123456", first_name: 'Cassie', last_name: 'Dover', sport: 'yoga', price_per_hour: 30, abilities_taught: "beginner", is_client: false)
james = User.create(email: "james@swim.com", password: "123456", first_name: 'James', last_name: 'David', sport: 'strength', price_per_hour: 45, abilities_taught: "intermediate", is_client: false)
adrian = User.create(email: "adrian@swim.com", password: "123456", first_name: 'Adrian', last_name: 'Young', sport: 'strength', price_per_hour: 65, abilities_taught: "advanced", is_client: false)
ben = User.create(email: "ben@swim.com", password: "123456", first_name: 'Ben', last_name: 'Peel', sport: 'running', price_per_hour: 50, abilities_taught: "beginner", is_client: false)
adam = User.create(email: "adam@swim.com", password: "123456", first_name: 'Adam', last_name: 'Stanley', sport: 'running', price_per_hour: 35, abilities_taught: "beginner", is_client: false)
mike = User.create(email: "mike@swim.com", password: "123456", first_name: 'Michael', last_name: 'Gregory', sport: 'swimming', price_per_hour: 60, abilities_taught: "beginner", is_client: false)


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
mike.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542970011/mike1.jpg"
mike.save

puts 'Adding bios'
john.bio = "My background is in competitive swimming and I was previously ranked in the top 10 in the UK for the 100m freestyle and 50m backstroke. I have competed at the British team selection trials for the 2011 World Championships as well as the 2012 Olympic Games trials."
john.save
paul.bio = "Paul's my name, swimming's my game. Was Michael Phelps' coach for 8 years before we had a falling out when we realised that I was actually way quicker than him at swimming. Anyway I'm out a job now so I'm looking for students to take under my MASSIVE swimming wings."
paul.save
cassie.bio = "After years of martial arts practice, made the change to Yoga in 2012 in order to try and heal a re-occurring injury.  Immediate fell in love with the practice and what it did for my body and mind. I am particularly interested in the anatomy aspect and believe yoga really is “for all” no matter what your natural body structure is or what limitations you may feel you have."
cassie.save
james.bio = "I had no specific interest in bodybuilding until age 16 when I met muscleman David Cohen. Upon learning that Cohen lifted weights at his friend's house, I joined in out of curiosity. My legendary physique would begin to grow from barbells, dumbbells and a simple chinning bar."
james.save
adrian.bio = "I began lifting weights at the age of 15. I won the Mr. Universe title at age 20 and went on to win the Mr. Olympia contest seven times, remaining a prominent presence in bodybuilding and writing many books and articles on the sport. The Adrian Sports Festival, considered one of the best professional bodybuilding competitions in recent years, is named after me. I am widely considered to be one of the greatest bodybuilders of all-time as well as that sport's most charismatic ambassador."
adrian.save
ben.bio = "I am a Jamaican retired sprinter and world record holder in the 100 metres, 200 metres and 4 × 100 metres relay. My reign as Olympic Games champion in all of these events spans three Olympics. Owing to my achievements and dominance in sprint competition, I am widely considered to be the greatest sprinter of all time."
ben.save
adam.bio = "I am a fat retired sprinter and am not a world record holder in the 100 metres, 200 metres and 4 × 100 metres relay. My non-existent reign as Olympic Games champion in all of these events spans three Olympics. Owing to my achievements and dominance in sprint competition, I am widely considered to be the worst sprinter of all time."
adam.save
mike.bio = "My background is in competitive swimming and I was previously ranked in the top 10 in the UK for the 100m freestyle and 50m backstroke. I have competed at the British team selection trials for the 2011 World Championships as well as the 2012 Olympic Games trials."
mike.save

puts 'Creating clients'
mary = User.create(email: "mary@swim.com", password: "123456", first_name: 'Mary', last_name: 'Meister', is_client: true)
georgia = User.create(email: "georgia@swim.com", password: "123456", first_name: 'georgia', last_name: 'Smith', is_client: true)
nico = User.create(email: "nico@swim.com", password: "123456", first_name: 'georgia', last_name: 'Smith', is_client: true)

mary.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799963/train2.jpg"
mary.save
georgia.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799963/train3.jpg"
georgia.save
nico.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1542799963/Nico1.jpg"
nico.save

puts 'Creating Location'
greenwich1 = Location.create(address: "King William Walk, London SE10 9HT", user_id: john.id)
greenwich2 = Location.create(address: "5B Greenwich Market, London SE10 9HZ", user_id: cassie.id)
greenwich3 = Location.create(address: "178 Greenwich High Rd, London SE10 8NN", user_id: adrian.id)
greenwich4 = Location.create(address: "56 Royal Hill, Greenwich, London SE10 8RT", user_id: ben.id)
greenwich5 = Location.create(address: "11 Victoria Parade, London SE10 9FR", user_id: adam.id)

pimlico1 = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: mike.id)
pimlico2 = Location.create(address: "Lupus St, Pimlico, London SW1V 3AT", user_id: cassie.id)
pimlico3 = Location.create(address: "52 Cambridge St, Pimlico, London SW1V 4QQ", user_id: adrian.id)
pimlico4 = Location.create(address: "74 Warwick Square, Pimlico, London SW1 2AR", user_id: john.id)
pimlico4 = Location.create(address: "Tachbrook Street, Westminster SW1V 2QE", user_id: paul.id)

hammersmith1 = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: paul.id)
hammersmith2 = Location.create(address: "Hammersmith Rd, Hammersmith, London W14 8UX", user_id: james.id)
hammersmith3 = Location.create(address: "Palliser Rd, Hammersmith, London W14 9EQ", user_id: ben.id)
hammersmith4 = Location.create(address: "Normand Park, Lillie Rd, Fulham Pools, London SW6 7ST", user_id: mike.id)
hammersmith5 = Location.create(address: "373 Lillie Rd, Hammersmith, London SW6 7PD", user_id: john.id)

kensington1 = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: james.id)
kensington2 = Location.create(address: "11A Stratford Rd, Kensington, London W8 6RF", user_id: cassie.id)
kensington3 = Location.create(address: "254 Road, Earls Court, London SW5 9AD", user_id: adrian.id)
kensington4 = Location.create(address: "45 Phillimore Walk, Kensington, London W8 7RZ", user_id: paul.id)
kensington5 = Location.create(address: "58-60 Kensington Church St, Kensington, London W8 4DB", user_id: ben.id)

puts 'Finished'
