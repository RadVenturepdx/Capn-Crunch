# Users
User.create!(name:  "Brad Beazley",
             email: "beazley2@pdx.edu",
             location: "Portland",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name = Faker::name
  email = "#{name}#{n}@example.com"
  location = "Location#{n % 5 + 1}"
  password = "password"
  User.create!(name: name,
               email: email,
               location: location,
               password:              password,
               password_confirmation: password)
end


