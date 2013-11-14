require 'faker'

10.times do
  User.create(user: Faker::Name.name, 
              email: Faker::Internet.email,
              password: 'password')
end

30.times do
  Post.create(title: Faker::Company.bs,
              body: Faker::Lorem.paragraph,
              user_id: rand(1..10))
end

