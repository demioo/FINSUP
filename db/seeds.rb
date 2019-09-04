# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Review.create!(client: User.first, request: Request.first)
Request.destroy_all
puts "Destroying users"
User.destroy_all
puts "Creating users"
User.create!(first_name: 'Luke', last_name: 'Connors', email: 'luke@gmail.com', password: '123456', role: 'advisor', response_time: '10', saving: true, bio: 'Hello my name is Luke!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Marc', last_name: 'Levy', email: 'marc@gmail.coms', password: '123456', role: 'advisor', response_time: '15', saving: true, bio: 'Hello my name is Marc!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Charles', last_name: 'Smith', email: 'charles@gmail.com', password: '123456', role: 'advisor', response_time: '16', saving: true, bio: 'Hello my name is Charles!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Melissa', last_name: 'Brett', email: 'mexl@gmail.com', password: '123456', role: 'advisor', response_time: '10', budgeting: true, bio: 'Hello my name is Melissa!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Jack', last_name: 'Minor', email: 'jack@gmail.com', password: '123456', role: 'advisor', response_time: '15', budgeting: true, bio: 'Hello my name is Jack!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Sophie', last_name: 'Pearl', email: 'sophie@gmail.com', password: '123456', role: 'advisor', response_time: '5', budgeting: true, bio: 'Hello my name is Sophie!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Alex', last_name: 'Willis', email: 'alex@gmail.com', password: '123456', role: 'advisor', response_time: '10', bill_paying: true, bio: 'Hello my name is Alex!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Kathy', last_name: 'Rhoden', email: 'kathy@gmail.com', password: '123456', role: 'advisor', response_time: '15', bill_paying: true, bio: 'Hello my name is Kathy!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
User.create!(first_name: 'Julien', last_name: 'Pel', email: 'julien@gmail.com', password: '123456', role: 'advisor', response_time: '5', bill_paying: true, bio: 'Hello my name is Julien!', remote_photo_url: 'http://res.cloudinary.com/dzy7p5au0/image/upload/c_fill,h_1000/v1567509605/rn7pdaxgqpalt7emoiso.jpg')
puts "Finished creating users"
