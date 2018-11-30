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
mike = User.create(email: "mike@swim.com", password: "123456", first_name: 'Michael', last_name: 'Gregory', sport: 'swimming', price_per_hour: 60, abilities_taught: "beginner", is_client: false)
mike.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568792/Sportlance/Seed/users/mike.jpg"
mike.bio = "My background is in competitive swimming and I was previously ranked in the top 10 in the UK for the 100m freestyle and 50m backstroke. I have competed at the British team selection trials for the 2011 World Championships as well as the 2012 Olympic Games trials."
mike.save
pimlico1 = Location.create(address: "Dolphin Square, London SW1V 3LX", user_id: mike.id)
hammersmith4 = Location.create(address: "Normand Park, Lillie Rd, Fulham Pools, London SW6 7ST", user_id: mike.id)

john = User.create(email: "john@swim.com", password: "123456", first_name: 'John', last_name: 'Watson', sport: 'swimming', price_per_hour: 40, abilities_taught: "beginner", is_client: false)
john.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568788/Sportlance/Seed/users/john.jpg"
john.bio = "My background is in competitive swimming and I was previously ranked in the top 10 in the UK for the 100m freestyle and 50m backstroke. I have competed at the British team selection trials for the 2011 World Championships as well as the 2012 Olympic Games trials."
john.save
greenwich1 = Location.create(address: "King William Walk, London SE10 9HT", user_id: john.id)
pimlico4 = Location.create(address: "74 Warwick Square, Pimlico, London SW1 2AR", user_id: john.id)
hammersmith5 = Location.create(address: "373 Lillie Rd, Hammersmith, London SW6 7PD", user_id: john.id)

paul = User.create(email: "paul@swim.com", password: "123456", first_name: 'Paul', last_name: 'Eadie', sport: 'swimming', price_per_hour: 55, abilities_taught: "advanced", is_client: false)
paul.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568783/Sportlance/Seed/users/paul.jpg"
paul.bio = "Paul's my name, swimming's my game. Was Michael Phelps' coach for 8 years before we had a falling out when we realised that I was actually way quicker than him at swimming. Anyway I'm out a job now so I'm looking for students to take under my MASSIVE swimming wings."
paul.save
pimlico5 = Location.create(address: "Tachbrook Street, Westminster SW1V 2QE", user_id: paul.id)
hammersmith1 = Location.create(address: "121 King St, Hammersmith, London W6 9JG", user_id: paul.id)
kensington4 = Location.create(address: "45 Phillimore Walk, Kensington, London W8 7RZ", user_id: paul.id)

cassie = User.create(email: "cassie@swim.com", password: "123456", first_name: 'Cassie', last_name: 'Dover', sport: 'yoga', price_per_hour: 30, abilities_taught: "beginner", is_client: false)
cassie.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568797/Sportlance/Seed/users/cassie.jpg"
cassie.bio = "After years of martial arts practice, made the change to Yoga in 2012 in order to try and heal a re-occurring injury.  Immediate fell in love with the practice and what it did for my body and mind. I am particularly interested in the anatomy aspect and believe yoga really is “for all” no matter what your natural body structure is or what limitations you may feel you have."
cassie.save
greenwich2 = Location.create(address: "5B Greenwich Market, London SE10 9HZ", user_id: cassie.id)

ann = User.create(email: "ann@swim.com", password: "123456", first_name: 'Ann', last_name: 'Cooper', sport: 'yoga', price_per_hour: 35, abilities_taught: "beginner", is_client: false)
ann.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568799/Sportlance/Seed/users/ann.jpg"
ann.bio = "I've practiced yoga ever since I left school."
ann.save
kensington2 = Location.create(address: "11A Stratford Rd, Kensington, London W8 6RF", user_id: ann.id)

james = User.create(email: "james@swim.com", password: "123456", first_name: 'James', last_name: 'David', sport: 'strength', price_per_hour: 45, abilities_taught: "intermediate", is_client: false)
james.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568799/Sportlance/Seed/users/james.jpg"
james.bio = "I had no specific interest in bodybuilding until age 16 when I met muscleman David Cohen. Upon learning that Cohen lifted weights at his friend's house, I joined in out of curiosity. My legendary physique would begin to grow from barbells, dumbbells and a simple chinning bar."
james.save
hammersmith2 = Location.create(address: "Hammersmith Rd, Hammersmith, London W14 8UX", user_id: james.id)
kensington1 = Location.create(address: "The Roof Gardens, Kensington High Street, London W8 5SA", user_id: james.id)

adrian = User.create(email: "adrian@swim.com", password: "123456", first_name: 'Adrian', last_name: 'Young', sport: 'strength', price_per_hour: 65, abilities_taught: "advanced", is_client: false)
adrian.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568793/Sportlance/Seed/users/adrian.jpg"
adrian.bio = "I began lifting weights at the age of 15. I won the Mr. Universe title at age 20 and went on to win the Mr. Olympia contest seven times, remaining a prominent presence in bodybuilding and writing many books and articles on the sport. The Adrian Sports Festival, considered one of the best professional bodybuilding competitions in recent years, is named after me. I am widely considered to be one of the greatest bodybuilders of all-time as well as that sport's most charismatic ambassador."
adrian.save
greenwich3 = Location.create(address: "178 Greenwich High Rd, London SE10 8NN", user_id: adrian.id)
pimlico3 = Location.create(address: "52 Cambridge St, Pimlico, London SW1V 4QQ", user_id: adrian.id)
kensington3 = Location.create(address: "254 Road, Earls Court, London SW5 9AD", user_id: adrian.id)

ben = User.create(email: "ben@swim.com", password: "123456", first_name: 'Ben', last_name: 'Peel', sport: 'running', price_per_hour: 50, abilities_taught: "beginner", is_client: false)
ben.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569206/Sportlance/Seed/users/ben.jpg"
ben.bio = "I am a Jamaican retired sprinter and world record holder in the 100 metres, 200 metres and 4 × 100 metres relay. My reign as Olympic Games champion in all of these events spans three Olympics. Owing to my achievements and dominance in sprint competition, I am widely considered to be the greatest sprinter of all time."
ben.save
greenwich4 = Location.create(address: "56 Royal Hill, Greenwich, London SE10 8RT", user_id: ben.id)
kensington5 = Location.create(address: "58-60 Kensington Church St, Kensington, London W8 4DB", user_id: ben.id)

adam = User.create(email: "adam@swim.com", password: "123456", first_name: 'Adam', last_name: 'Stanley', sport: 'running', price_per_hour: 35, abilities_taught: "beginner", is_client: false)
adam.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568800/Sportlance/Seed/users/adam.jpg"
adam.bio = "I am a fat retired sprinter and am not a world record holder in the 100 metres, 200 metres and 4 × 100 metres relay. My non-existent reign as Olympic Games champion in all of these events spans three Olympics. Owing to my achievements and dominance in sprint competition, I am widely considered to be the worst sprinter of all time."
adam.save
greenwich5 = Location.create(address: "11 Victoria Parade, London SE10 9FR", user_id: adam.id)

andrew = User.create(email: "andrew@swim.com", password: "123456", first_name: 'Andrew', last_name: 'Brown', sport: 'running', price_per_hour: 45, abilities_taught: "beginner", is_client: false)
andrew.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568800/Sportlance/Seed/users/andrew.jpg"
andrew.bio = "I am a professional trainer with 10 years of experience. I cant lead training for short and long distances."
andrew.save
bermondsey2 = Location.create(address: "168 Jamaica Rd, London SE16 4RT", user_id: andrew.id)

ariel = User.create(email: "ariel@swim.com", password: "123456", first_name: 'Ariel', last_name: 'Rogers', sport: 'rock climbing', price_per_hour: 55, abilities_taught: "beginner", is_client: false)
ariel.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568794/Sportlance/Seed/users/ariel.jpg"
ariel.bio = "I am a passionate rock climber who did crazy ascents in Yosemite."
ariel.save
finsbury1 = Location.create(address: "Green Lanes, London N4 2HA", user_id: ariel.id)

tiffany = User.create(email: "tiffany@swim.com", password: "123456", first_name: 'Tiffany', last_name: 'Perry', sport: 'rock climbing', price_per_hour: 25, abilities_taught: "beginner", is_client: false)
tiffany.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568797/Sportlance/Seed/users/tiffany.jpg"
tiffany.bio = "Always on the rope, ready to take you up there."
tiffany.save
millend1 = Location.create(address: "Haverfield Rd, Mile End, London E3 5BE", user_id: tiffany.id)

quino = User.create(email: "quino@swim.com", password: "123456", first_name: 'Quino', last_name: 'Hernandez', sport: 'triathlon', price_per_hour: 75, abilities_taught: "beginner", is_client: false)
quino.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568797/Sportlance/Seed/users/quino.jpg"
quino.bio = "I've won 3 international triathlons and participated to 5 marathons as well."
quino.save
bermondsey1 = Location.create(address: "250 Jamaica Rd, London SE16 4BD", user_id: quino.id)

scott = User.create(email: "scott@swim.com", password: "123456", first_name: 'Scott', last_name: 'Jenkins', sport: 'golf', price_per_hour: 120, abilities_taught: "beginner", is_client: false)
scott.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568797/Sportlance/Seed/users/scott.jpg"
scott.bio = "I've won the green jacket."
scott.save
bermondsey3 = Location.create(address: "Amron House, Borough Rd, London SE1 0AE", user_id: scott.id)

lucy = User.create(email: "lucy@swim.com", password: "123456", first_name: 'Lucy', last_name: 'Thomson', sport: 'golf', price_per_hour: 100, abilities_taught: "beginner", is_client: false)
lucy.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568788/Sportlance/Seed/users/lucy.jpg"
lucy.bio = "In the top 5 british players."
lucy.save
canary1 = Location.create(address: "16-19 Canada Square, Canary Wharf, London E14 5ER", user_id: lucy.id)

chan = User.create(email: "chan@swim.com", password: "123456", first_name: 'Chan', last_name: 'Sanders', sport: 'tennis', price_per_hour: 80, abilities_taught: "beginner", is_client: false)
chan.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568786/Sportlance/Seed/users/chan.jpg"
chan.bio = "In the top 50 british players."
chan.save
queens1 = Location.create(address: "Palliser Rd, Hammersmith, London W14 9EQ", user_id: chan.id)

george = User.create(email: "george@swim.com", password: "123456", first_name: 'George', last_name: 'Robinson', sport: 'tennis', price_per_hour: 70, abilities_taught: "beginner", is_client: false)
george.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543568786/Sportlance/Seed/users/george.jpg"
george.bio = "In the top 100 british players."
george.save
queens2 = Location.create(address: "Barnes Sports Club, 261 Lonsdale Rd, Barnes, London SW13 9QL", user_id: george.id)


puts 'Creating clients'
mary = User.create(email: "mary@swim.com", password: "123456", first_name: 'Mary', last_name: 'Meister', is_client: true)
mary.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569729/Sportlance/Seed/clients/mary.jpg"
mary.save

georgia = User.create(email: "georgia@swim.com", password: "123456", first_name: 'Georgia', last_name: 'Smith', is_client: true)
georgia.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569727/Sportlance/Seed/clients/georgia.jpg"
georgia.save

nico = User.create(email: "nico@swim.com", password: "123456", first_name: 'Nicolas', last_name: 'Hennick', is_client: true)
nico.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569312/Sportlance/Seed/clients/nico.jpg"
nico.save

alex = User.create(email: "alex@swim.com", password: "123456", first_name: 'Alex', last_name: 'Johnson', is_client: true)
alex.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569732/Sportlance/Seed/clients/alex.jpg"
alex.save

kal = User.create(email: "kal@swim.com", password: "123456", first_name: 'Kal', last_name: 'Williams', is_client: true)
kal.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569730/Sportlance/Seed/clients/kal.jpg"
kal.save

steve = User.create(email: "steve@swim.com", password: "123456", first_name: 'Steve', last_name: 'Bell', is_client: true)
steve.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569729/Sportlance/Seed/clients/steve.jpg"
steve.save

alan = User.create(email: "alan@swim.com", password: "123456", first_name: 'Alan', last_name: 'Miller', is_client: true)
alan.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569732/Sportlance/Seed/clients/alan.jpg"
alan.save

wilson = User.create(email: "wilson@swim.com", password: "123456", first_name: 'Wilson', last_name: 'Davis', is_client: true)
wilson.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543569729/Sportlance/Seed/clients/wilson.jpg"
wilson.save

tikkho = User.create(email: "tikkho@swim.com", password: "123456", first_name: 'Tikkho', last_name: 'King', is_client: true)
tikkho.remote_photo_url = "https://res.cloudinary.com/dsjm0qvdj/image/upload/v1543570481/Sportlance/Seed/clients/tikkho.jpg"
tikkho.save

puts 'Finished'
