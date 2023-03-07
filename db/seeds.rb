require "open-uri"

puts "Cleaning database"
User.destroy_all
Route.destroy_all
Destination.destroy_all
RouteDestination.destroy_all

puts "Seeding database"

user1 = User.create!(email: "rachel@gmail.com", password: "rachel", first_name: "Rachel", last_name: "Smith", age: 34, location: "London")
puts "Seeding 1/5 users..."
avatar1 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677762559/rsz_rsz_2thumbnail_alps_selfie_i6mkbd.png")
user1.photo.attach(io: avatar1, filename: "av1.jpg", content_type: "image/png")

user2 = User.create!(email: "spongebob@gmail.com", password: "squarepants", first_name: "Sponge", last_name: "Bob", age: 22, location: "Bristol")
puts "Seeding 2/5 users..."
avatar2 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677762866/spongebob_igaeww.jpg")
user2.photo.attach(io: avatar2, filename: "av2.jpg", content_type: "image/jpg")

user3 = User.create!(email: "rick@gmail.com", password: "pickle", first_name: "Rick", last_name: "Morty", age: 73, location: "High Wickham")
puts "Seeding 3/5 users..."
avatar3 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677764458/rick2_vwm1wj.png")
user3.photo.attach(io: avatar3, filename: "av3.jpg", content_type: "image/png")

user4 = User.create!(email: "bonnie@gmail.com", password: "killercouple", first_name: "Bonnie", last_name: "Clyde", age: 45, location: "Tonbridge")
puts "Seeding 4/5 users..."
avatar4 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677764458/bonnie2_qnhju9.png")
user4.photo.attach(io: avatar4, filename: "av4.jpg", content_type: "image/jpg")

user5 = User.create!(email: "brian@gmail.com", password: "butter", first_name: "Brian", last_name: "Butterfield", age: 58, location: "Hampshire")
puts "Seeding 5/5 users..."
avatar5 = URI.open("https://res.cloudinary.com/dcuj8efm3/image/upload/v1677764458/brian2_lz7zhw.jpg")
user5.photo.attach(io: avatar5, filename: "av5.jpg", content_type: "image/jpg")


puts "Seeding destinations..."
puts "No destinations in seed file yet!"

puts "Seeding routes..."
puts "No routes in seed file yet!"

# users = User.all.select { |user| user != user5 }
# 6.times {
#   start_date = Faker::Date.between(from: '2022-09-23', to: '2023-09-25')
#   end_date = start_date + rand(1..90)
#   Booking.create(pickup_date: start_date, dropoff_date: end_date, user: users.sample, car: brians_cars.sample, status: "requested")
# }

puts "Database seeded!"
