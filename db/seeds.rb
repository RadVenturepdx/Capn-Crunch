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
      location = 'Mount Hood'
    when 1
      location = 'Mount Bachelor'
    else
      location = 'Mount Whistler'
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
  i = 0
  availability = Array.new(7)
  availability.each do
    x = rand(4)
    case x
      when 0
        availability[i] = (rand(6) + 5).to_s + 'am to ' + (rand(10) + 1).to_s + 'pm'
      when 1
        availability[i] = (rand(2) + 5).to_s + 'am to ' + (rand(5) + 7).to_s + 'am and ' + (rand(6) + 1).to_s + 'pm to ' + (rand(4) + 5).to_s + 'pm'
      when 2
        availability[i] = 'Varies by week. Please contact me!'
      else
        availability[i] = 'Unavailable'
    end
    i += 1
  end
  Guide.create!(user_id: user.id,
                location: location,
                specialty: specialty,
                rate: rate,
                sun_avail: availability[0],
                mon_avail: availability[1],
                tues_avail: availability[2],
                wed_avail: availability[3],
                thurs_avail: availability[4],
                fri_avail: availability[5],
                sat_avail: availability[6]
  )
}

reviewers = User.where(id: 41..60)
10.times do
  reviewers.each { |reviewer|
    content = Faker::Lorem.sentences(5).join(" ")
    guide_id = rand(40) + 1
    rating = rand(5) + 1
    Review.create!(user_id: reviewer.id,
                   guide_id: Guide.find(guide_id).id,
                   content: content,
                   rating: rating)
  }
end

reservers = User.where(id: 61..90)
5.times do
  reservers.each { |reserver|
    guide_id = rand(40) + 1
    Reservation.create!(user_id: reserver.id,
                        guide_id: Guide.find(guide_id).id)
    }
end

