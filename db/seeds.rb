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

User.create!(first_name: 'Clark', last_name: 'Kent', email: 'clark@gmail.com', password: '123456', role: 'advisor', response_time: '10', budgeting: true, bio: 'I am a superhuman financial advisor, ready to work with you to ensure you and your family’s financial future.  After 15 years saving the planet from financial peril, I made the decision to volunteer with FINSUP. Over the past year, I have worked with more than 20 clients to help them create a budget to win at life.', remote_photo_url: 'https://res.cloudinary.com/dzy7p5au0/image/upload/v1567681581/Henry_veyho6.jpg')

User.create!(first_name: 'Marc', last_name: 'Bou Saleh', email: 'marc@gmail.coms', password: '123456', role: 'advisor', response_time: '15', budgeting: true, bio: 'Hello, I provide independent financial advice on all aspects of financial planning, with a focus on creating savings plans for families and individuals. Financial planning to me is all about building long term relationships and whilst money may not be the most important thing in life, it is significant, and it plays a central part in the lifestyle we enjoy and the security we feel.', remote_photo_url: 'https://res.cloudinary.com/dzy7p5au0/image/upload/v1567681581/Marc_mehfwt.jpg')

User.create!(first_name: 'Charles', last_name: 'Geoffrey', email: 'charles@gmail.com', password: '123456', role: 'advisor', response_time: '16', budgeting: true, bio: 'Hello! I work closely with your spending style to offer a truly holistic approach to financial planning. By developing long term relationships with people, treating them as individuals and taking their specific objectives into account, I can help you achieve your personal aspirations. The emphasis is on providing specialist, expert advice with a high degree of individual client care.', remote_photo_url: 'https://res.cloudinary.com/dzy7p5au0/image/upload/v1567681819/Charles_fxwinp.jpg')

User.create!(first_name: 'Melissa', last_name: 'Connors', email: 'melissa@gmail.com', password: '123456', role: 'advisor', response_time: '10', budgeting: true, bio: 'Hello I am Melissa. I am an experienced and knowledgeable financial advisor, ready to work with you to ensure you and your family’s financial future. I have a degree in finance from University of Georgia, and I have also been certified in  Financial Planning. After 4 years  working with FinanceToday, I made the decision to start  my own financial services company, FINSUP. Over the past year, I have worked with more than 60 clients to help them budget, save, and manage bills to help establish a solid financial foundation. Would love to help you!', remote_photo_url: 'https://res.cloudinary.com/dzy7p5au0/image/upload/v1567681581/Melissa_lyks52.jpg')

User.create!(first_name: 'Francesca', last_name: 'Vago', email: 'francesca@gmail.com', password: '123456', role: 'advisor', response_time: '10', budgeting: true, bio: 'I am an experienced certified financial advisor with 5 years of experience serving my local community and their budgeting needs.  I pride myself on developing useful and efficient plans for families, so they can have a solid financial foundation.', remote_photo_url: 'https://res.cloudinary.com/dzy7p5au0/image/upload/v1567681649/Francesca_ybf5u8.jpg')

User.create!(first_name: 'Julien', last_name: 'Pel', email: 'julien@gmail.com', password: '123456', role: 'advisor', response_time: '5', budgeting: true, bio: 'I am a Junior Financial Advisor with a lot of crypto experience. Give me your money and I will teach you everything there is to know about blockchain, Bitcoin, and how to make mad gains.', remote_photo_url: 'https://res.cloudinary.com/dzy7p5au0/image/upload/v1567681585/Julien_yztksg.jpg')

puts "Finished creating users"
