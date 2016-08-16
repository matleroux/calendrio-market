# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user1 = User.create(email: "chevalier@live.fr", password: "jojojojo")
user2 = User.create(email: "mat@live.fr", password: "matmat")
user3 = User.create(email: "roger@live.fr", password: "rogerroger", first_name: "roger", last_name: "scott")

place1 = Place.new(name: "lewagon", city: "Paris", country: "france")
place1.user = user1
place1.save

place2 = Place.new(name: "plug", city: "Sao Paulo", country: "Brésil" )
place2.user = user2
place2.save

place3 = Place.new(name: "maison", city: "marly le roi", country: "France")
place3.user = user3
place3.save

booking1 = Booking.new(duration: 11, number_of_participants: 15, status: "pending")
booking1.place = place1
booking1.user = user1
booking1.save

booking2 = Booking.new(duration: 8, number_of_participants: 55, status: "pending")
booking2.place = place2
booking2.user = user2
booking2.save


