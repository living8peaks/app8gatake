User.create!(
<<<<<<< HEAD
  name: '8gatake_admin',
  email: 'yatu@g.com',
=======
  name: 'tarou227',
  email: 'example@g.com',
>>>>>>> master
  password: 'asdf1234!',
  password_confirmation: 'asdf1234!',
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)
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
  name = Faker::Name.name
  email = "example-#{n+1}@g.com"
  User.create!(
    name: name,
    email: email,
    password: 'asdf1234!',
    password_confirmation: 'asdf1234!',
>>>>>>> master
    activated: true,
    activated_at: Time.zone.now
  )
end
<<<<<<< HEAD

users = User.order(:created_at).take(2)
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
=======
>>>>>>> master
