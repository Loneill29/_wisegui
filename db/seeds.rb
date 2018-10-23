10.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end

users = User.all

50.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::Food.measurement,
     body:   Faker::Food.description
   )
 end

 wikis = Wiki.all

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
