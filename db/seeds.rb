# Users

99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  case n % 4
    when 0
      location = 'Mount Hood Ski Bowl'
    when 1
      location = 'Mount Hood Meadows'
    when 2
      location = 'Timberline Lodge'
    when 3
      location = 'Mount Bachelor'
  end
  password = "password"
  age = rand(75) + 18
  phone_number = Faker::Base.numerify("(###) ###-####")
  profile = Faker::Lorem.sentences(3).join(" ")
  User.create!(name: name,
               email: email,
               location: location,
               phone_number: phone_number,
               age: age,
               password:              password,
               password_confirmation: password,
               profile: profile)
end


