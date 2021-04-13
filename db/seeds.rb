User.create!(
<<<<<<< HEAD
<<<<<<< HEAD
  name: '8gatake_admin',
  email: 'yatu@g.com',
=======
  name: 'tarou227',
  email: 'example@g.com',
>>>>>>> master
=======
  name: '8gatake_admin',
  email: 'yatu@g.com',
>>>>>>> master
  password: 'asdf1234!',
  password_confirmation: 'asdf1234!',
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)
<<<<<<< HEAD
<<<<<<< HEAD
40.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@g.com"
  password = 'asdf1234!'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
=======
60.times do |n|
=======
40.times do |n|
>>>>>>> master
  name = Faker::Name.name
  email = "example-#{n+1}@g.com"
  password = 'asdf1234!'
  User.create!(
    name: name,
    email: email,
<<<<<<< HEAD
    password: 'asdf1234!',
    password_confirmation: 'asdf1234!',
>>>>>>> master
=======
    password: password,
    password_confirmation: password,
>>>>>>> master
    activated: true,
    activated_at: Time.zone.now
  )
end
<<<<<<< HEAD
<<<<<<< HEAD

users = User.order(:created_at).take(2)
=======

users = User.order(:created_at).take(6)
>>>>>>> master
30.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end

users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
<<<<<<< HEAD
=======
>>>>>>> master
=======
>>>>>>> master
