# Users


99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  age = rand(75) + 18
  phone_number = Faker::Base.numerify("(###) ###-####")

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
               address: address,
               city: city,
               state: state,
               zipcode: zipcode,
               country: country)
end

users = User.order(:created_at).take(40)
users.each { |user|
  n = rand(2)
  case n
    when 0
      hood = true
    else
      hood = false
  end
  n = rand(2)
  case n
    when 0
      bachelor = true
    else
      bachelor = false
  end
  n = rand(2)
  case n
    when 0
      whistler = true
    else
      whistler = false
  end
  if (!hood && !bachelor && !whistler)
    hood = true
  end

  n = rand(2)
  case n
    when 0
      downhill = true
    else
      downhill = false
  end
  n = rand(2)
  case n
    when 0
      crosscountry = true
    else
      crosscountry = false
  end
  n = rand(2)
  case n
    when 0
      snowboard = true
    else
      snowboard = false
  end
  if (!downhill && !crosscountry && !snowboard)
    downhill = true
  end

  rate = rand(20) + 15
  profile = Faker::Lorem.sentences(3).join(" ")
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
                hood: hood,
                bachelor: bachelor,
                whistler: whistler,
                downhill: downhill,
                crosscountry: crosscountry,
                snowboard: snowboard,
                rate: rate,
                profile: profile,
                sun_avail: availability[0],
                mon_avail: availability[1],
                tues_avail: availability[2],
                wed_avail: availability[3],
                thurs_avail: availability[4],
                fri_avail: availability[5],
                sat_avail: availability[6]
  )
}

reviewers = User.where(id: 60..101)
10.times do
  reviewers.each { |reviewer|
    content  = Faker::Lorem.sentences(5).join(" ")
    guide_id = rand(40) + 1
    rating   = rand(5) + 1
    title    = 'Review Title'
    Review.create!(user_id: reviewer.id,
                   guide_id: Guide.find(guide_id).id,
                   content: content,
                   rating: rating,
                   title: title)
  }
end

reservers = User.where(id: 61..90)
5.times do
  reservers.each { |reserver|
    guide_id = rand(40) + 1
    people = rand(9) + 1
    price = rand(25) + 20
    rand_location = rand(3)
    case rand_location
      when 0
        location = 'Whistler'
      when 1
        location = 'Mount Hood'
      else
        location = 'Mount Bachelor'
    end
    rand_status = rand(5)  # More likely to have more 'Pending' transactions
    case rand_status
      when 0
        payment_status = 'Paid'
      when 1
        payment_status = 'Denied'
      else
        payment_status = 'Pending'
    end
    time = "7am"
    note = "Radventure!"
    Reservation.create!(user_id: reserver.id,
                        guide_id: Guide.find(guide_id).id,
                        price: price,
                        location: location,
                        payment_status: payment_status,
                        time: time,
                        number_of_people: people,
                        note: note)
    }
end

