require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user1 = User.new(id: 1,
        name: "Example Guide",
        email: "guide@example.com",
        phone_number: "503-555-4353",
        age: 32,
        password: "foobar",
        password_confirmation: "foobar",
        profile: 'Profile',
        address: '123 Main St',
        city: 'Anytown',
        state: 'AL',
        zipcode: '97124',
        country: 'USA'
    )

    @guide = Guide.new(id: 1,
                       user: @user,
                       hood: true,
                       bachelor: false,
                       whistler: true,
                       downhill: true,
                       crosscountry: true,
                       snowboard: false,
                       rate: 25,
                       sun_avail: 'Unavailable',
                       mon_avail: '8am - 5pm',
                       tues_avail: '11am - 4pm',
                       wed_avail: 'Unavailable',
                       thurs_avail: '7am - 4pm',
                       fri_avail: '9am - 9pm',
                       sat_avail: 'Varies'
    )

    @user2 = User.new(id: 2,
                      name: "Example Reviewer",
                      email: "reviewer@example.com",
                      phone_number: "503-355-4353",
                      age: 35,
                      password: "foobar",
                      password_confirmation: "foobar",
                      profile: 'Profile',
                      address: '123 Main St',
                      city: 'Anytown',
                      state: 'AL',
                      zipcode: '97124',
                      country: 'USA'
    )

    @review = Review.new(user: @user2,
                         guide: @guide,
                         content: 'This guy was terrible.',
                         rating: 4
    )
  end

  test 'review should be valid' do
    assert @review.valid?
  end

  test 'user_id should be present' do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test 'guide_id should be present' do
    @review.guide_id = nil
    assert_not @review.valid?
  end

  test 'content should be present' do
    @review.content = '   '
    assert_not @review.valid?
  end

  test 'rating should be present' do
    @review.rating = nil
    assert_not @review.valid?
  end

  test 'content should be less than 1000 characters' do
    @review.content = 'a' * 1000
    assert_not @review.valid?
  end

  test 'rating should be greater or equal to 1' do
    @review.rating = 0
    assert_not @review.valid?
  end

  test 'rating should be less than or equal to 5' do
    @review.rating = 6
    assert_not @review.valid?
  end

  test 'order should be most recent first' do
    assert_equal Review.first, reviews(:most_recent)
  end
end
