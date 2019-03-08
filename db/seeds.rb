require 'random_data'

10.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end

users = User.all

premium = User.create!(
  email:    'premium2@email.com',
  password: '000000',
  role: 'premium'
)

25.times do
   Wiki.create!(
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     private: false
   )
 end

 25.times do
    Wiki.create!(
      user:   users.sample,
      title:  "PRIVATE #{RandomData.random_word}",
      body:   RandomData.random_paragraph,
      private: true
    )
  end
 wikis = Wiki.all

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
