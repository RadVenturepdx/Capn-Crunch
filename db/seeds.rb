# Users

99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email

  password = "password"
  age = rand(75) + 18
  phone_number = Faker::Base.numerify("(###) ###-####")
  profile = Faker::Lorem.sentences(3).join(" ")
  User.create!(name: name,
               email: email,
               phone_number: phone_number,
               age: age,
               password:              password,
               password_confirmation: password,
               profile: profile)
end

users = User.order(:created_at).take(40)
users.each { |user|
  n = rand(4)
  case n
    when 0
      location = 'Mount Hood Ski Bowl'
    when 1
      location = 'Mount Hood Meadows'
    when 2
      location = 'Timberline Lodge'
    when 3
      location = 'Mount Bachelor'
  end
  Guide.create!(user_id: user.id, location: location )
}




