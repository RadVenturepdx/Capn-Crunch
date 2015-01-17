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


