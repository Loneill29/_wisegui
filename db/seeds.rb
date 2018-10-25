require 'random_data'

10.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end

users = User.all

25.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::Food.measurement,
     body:   Faker::Food.description,
     private: false
   )
 end
 25.times do
    Wiki.create!(
      user:   users.sample,
      title:  "Private",
      body:   Faker::Food.description,
      private: true
    )
  end
 wikis = Wiki.all

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
