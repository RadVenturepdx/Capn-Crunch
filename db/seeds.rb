# Users

99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  age = rand(75) + 18
  phone_number = Faker::Base.numerify("(###) ###-####")
  profile = Faker::Lorem.sentences(3).join(" ")
  address = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zipcode = Faker::Address.zip_code
  case n % 3
    when 0
      country = 'Canada'
    when 1
      country = 'United States of America'
    else
      country = 'Mexico'
  end
  User.create!(name: name,
               email: email,
               phone_number: phone_number,
               age: age,
               password:              password,
               password_confirmation: password,
               profile: profile,
               address: address,
               city: city,
               state: state,
               zipcode: zipcode,
               country: country )
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
    else
      location = 'Mount Bachelor'
  end
  n = rand(3)
  case n
    when 0
      specialty = 'Downhill Skiing'
    when 1
      specialty = 'Crosscountry Skiing'
    else
      specialty = 'Snowboarding'
  end
  rate = rand(20) + 15
  Guide.create!(user_id: user.id,
                location: location,
                specialty: specialty,
                rate: rate)
}




