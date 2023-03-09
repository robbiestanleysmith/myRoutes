require "open-uri"

puts "Cleaning database"
RouteDestination.destroy_all
Destination.destroy_all
Route.destroy_all
User.destroy_all

puts "Seeding database"

user1 = User.create!(email: "rachel@gmail.com", password: "rachel", first_name: "Rachel", last_name: "Smith", age: 34, location: "London")
puts "Seeding 1 user..."
avatar1 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678277535/rachel2_zsjgbi.png")
user1.photo.attach(io: avatar1, filename: "av1.jpg", content_type: "image/png")

# user2 = User.create!(email: "spongebob@gmail.com", password: "squarepants", first_name: "Sponge", last_name: "Bob", age: 22, location: "Bristol")
# puts "Seeding 2/5 users..."
# avatar2 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677762866/spongebob_igaeww.jpg")
# user2.photo.attach(io: avatar2, filename: "av2.jpg", content_type: "image/jpg")

# user3 = User.create!(email: "rick@gmail.com", password: "pickle", first_name: "Rick", last_name: "Morty", age: 73, location: "High Wickham")
# puts "Seeding 3/5 users..."
# avatar3 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677764458/rick2_vwm1wj.png")
# user3.photo.attach(io: avatar3, filename: "av3.jpg", content_type: "image/png")

# user4 = User.create!(email: "bonnie@gmail.com", password: "killercouple", first_name: "Bonnie", last_name: "Clyde", age: 45, location: "Tonbridge")
# puts "Seeding 4/5 users..."
# avatar4 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677764458/bonnie2_qnhju9.png")
# user4.photo.attach(io: avatar4, filename: "av4.jpg", content_type: "image/jpg")

# user5 = User.create!(email: "brian@gmail.com", password: "butter", first_name: "Brian", last_name: "Butterfield", age: 58, location: "Hampshire")
# puts "Seeding 5/5 users..."
# avatar5 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677764458/brian2_lz7zhw.jpg")
# user5.photo.attach(io: avatar5, filename: "av5.jpg", content_type: "image/jpg")


puts "Seeding routes and destinations..."


route1 = Route.create!(title: "London Thames walking tour", user: user1, distance: "", time: "")
routepic1 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286626/london_zas6np.jpg")
route1.photo.attach(io: routepic1, filename: "rp1.jpg", content_type: "image/jpg")


dest1 = Destination.create!(latitude: 51.508530, longitude: -0.076132, title: "Tower of London", user: user1)
RouteDestination.create!(route: route1, destination: dest1)
destpic1 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286626/toweroflondon_wowyrp.jpg")
dest1.photo.attach(io: destpic1, filename: "dp1.jpg", content_type: "image/jpg")

dest2 = Destination.create!(latitude: 51.507595, longitude: -0.099356, title: "Tate Modern", user: user1)
RouteDestination.create!(route: route1, destination: dest2)
destpic2 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286626/toweroflondon_wowyrp.jpg")
dest2.photo.attach(io: destpic2, filename: "dp2.jpg", content_type: "image/jpg")

dest3 = Destination.create!(latitude: 51.503399, longitude: -0.119519, title: "London Eye", user: user1)
RouteDestination.create!(route: route1, destination: dest3)
destpic3 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286626/londoneye_yctsw7.jpg")
dest3.photo.attach(io: destpic3, filename: "dp3.jpg", content_type: "image/jpg")

dest4 = Destination.create!(latitude: 51.510357, longitude: -0.116773, title: "Big Ben", user: user1)
RouteDestination.create!(route: route1, destination: dest4)
destpic4 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286626/bigben_vfbvfi.jpg")
dest4.photo.attach(io: destpic4, filename: "dp4.jpg", content_type: "image/jpg")

dest5 = Destination.create!(latitude: 51.501476, longitude: -0.140634, title: "Buckingham Palace", user: user1)
RouteDestination.create!(route: route1, destination: dest5)
destpic5 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286626/buckinghampalace_usp6iw.jpg")
dest5.photo.attach(io: destpic5, filename: "dp5.jpg", content_type: "image/jpg")



route2 = Route.create!(title: "Exploring Lisbon", user: user1, distance: "", time: "")
routepic2 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286626/lisbon_boahbs.jpg")
route2.photo.attach(io: routepic2, filename: "rp2.jpg", content_type: "image/jpg")

dest6 = Destination.create!(latitude: 38.712139, longitude: -9.140246, title: "Convento do Carmo", user: user1)
RouteDestination.create!(route: route2, destination: dest6)
dest7 = Destination.create!(latitude: 38.71077, longitude: -9.145844, title: "Elevador da Bica", user: user1)
RouteDestination.create!(route: route2, destination: dest7)
dest8 = Destination.create!(latitude: 38.710648, longitude: -9.143312, title: "Praça Luís de Camões", user: user1)
RouteDestination.create!(route: route2, destination: dest8)
dest9 = Destination.create!(latitude: 38.713909, longitude: -9.133476, title: "Castelo de São Jorge", user: user1)
RouteDestination.create!(route: route2, destination: dest9)




route3 = Route.create!(title: "Paris architecture", user: user1, distance: "", time: "")
routepic3 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1678286627/eiffeltower_itl1at.png")
route3.photo.attach(io: routepic3, filename: "rp3.jpg", content_type: "image/png")

dest10 = Destination.create!(latitude: 48.858093, longitude: 2.294694, title: "Eiffel Tower", user: user1)
RouteDestination.create!(route: route3, destination: dest10)
dest11 = Destination.create!(latitude: 48.860294, longitude: 2.338629, title: "Musée du Louvre", user: user1)
RouteDestination.create!(route: route3, destination: dest11)
dest12 = Destination.create!(latitude: 48.860642, longitude: 2.352245, title: "Centre Pompidou", user: user1)
RouteDestination.create!(route: route3, destination: dest12)
dest13 = Destination.create!(latitude: 48.887691, longitude: 2.340607, title: "Sacré Coeur de Montmartre", user: user1)
RouteDestination.create!(route: route3, destination: dest13)




# users = User.all.select { |user| user != user5 }
# 6.times {
#   start_date = Faker::Date.between(from: '2022-09-23', to: '2023-09-25')
#   end_date = start_date + rand(1..90)
#   Booking.create(pickup_date: start_date, dropoff_date: end_date, user: users.sample, car: brians_cars.sample, status: "requested")
# }

puts "Database seeded!"
