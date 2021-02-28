User.create!(
  name: 'tarou227',
  email: 'example@g.com',
  password: 'asdf1234!',
  password_confirmation: 'asdf1234!',
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)
60.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@g.com"
  User.create!(
    name: name,
    email: email,
    password: 'asdf1234!',
    password_confirmation: 'asdf1234!',
    activated: true,
    activated_at: Time.zone.now
  )
end
