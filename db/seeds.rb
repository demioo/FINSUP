# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Review.create!(client: User.first, request: Request.first)
User.create!(first_name: 'Luke', last_name: 'Connors', email: 'luke@gmail.com', password: '123456', role: 'advisor', response_time: '10', saving: true)
User.create!(first_name: 'Marc', last_name: 'Levy', email: 'marc@gmail.com', password: '123456', role: 'advisor', response_time: '15', saving: true)
User.create!(first_name: 'Charles', last_name: 'Smith', email: 'charles@gmail.com', password: '123456', role: 'advisor', response_time: '16', saving: true)
User.create!(first_name: 'Melissa', last_name: 'Brett', email: 'mel@gmail.com', password: '123456', role: 'advisor', response_time: '10', budgeting: true)
User.create!(first_name: 'Jack', last_name: 'Minor', email: 'jack@gmail.com', password: '123456', role: 'advisor', response_time: '15', budgeting: true)
User.create!(first_name: 'Sophie', last_name: 'Pearl', email: 'sophie@gmail.com', password: '123456', role: 'advisor', response_time: '5', budgeting: true)
User.create!(first_name: 'Alex', last_name: 'Willis', email: 'alex@gmail.com', password: '123456', role: 'advisor', response_time: '10', bill_paying: true)
User.create!(first_name: 'Kathy', last_name: 'Rhoden', email: 'kathy@gmail.com', password: '123456', role: 'advisor', response_time: '15', bill_paying: true)
User.create!(first_name: 'Julien', last_name: 'Pel', email: 'julien@gmail.com', password: '123456', role: 'advisor', response_time: '5', bill_paying: true)
