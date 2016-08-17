# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user1 = User.create(first_name: "jonathan", last_name: "chevalier", email: "chevalier@live.fr", password: "jojojojo")
user2 = User.create(first_name: "mat", last_name: "leroux",email: "mat@live.fr", password: "matmat")
user3 = User.create(first_name: "roger", last_name: "that",email: "roger@live.fr", password: "rogerroger")

place1 = Place.new(name: "lewagon", city: "Paris", country: "france", )
place1.user = user1
place1.save

place2 = Place.new(name: "plug", address: "av. nova independencia 1200", city: "Sao Paulo", country: "Brésil", max_capacity: 45, price: 500, availability: "lundi au vendredi 8h à 18h", description: "super cool place" )
place2.user = user2
place2.save

place3 = Place.new(name: "maison",address: "av. nova independencia 890", city: "Sao Paulo", country: "Brésil", max_capacity: 150, price: 600, availability: "lundi au mercredi 8h à 18h", description: "plug hyper cool wohou place" )
place3.user = user3
place3.save

booking1 = Booking.new(duration: 11, number_of_participants: 15, status: "pending")
booking1.place = place1
booking1.user = user1
booking1.save

booking3 = Booking.new(start_time: Time.now, duration: 8, number_of_participants: 55, status: "pending")
booking3.place = place3
booking3.user = user3
booking3.save


