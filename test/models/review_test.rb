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
                       location: 'Mount Hood Meadows',
                       specialty: 'Downhill Skiing',
                       rate: 25,
                       availability: [true, false, false, true, true, false, true]

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
                         content: 'This guy was terrible.'
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

  test 'content should be less than 1000 characters' do
    @review.content = 'a' * 1000
    assert_not @review.valid?
  end

  test 'order should be most recent first' do
    assert_equal Review.first, reviews(:most_recent)
  end
end