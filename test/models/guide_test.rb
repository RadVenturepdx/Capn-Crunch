require 'test_helper'

class GuideTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      id: 1,
      name: "Example User",
      email: "user7@example.com",
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

    @guide = Guide.new(
      user: @user,
      location: 'Mount Hood Meadows'
    )
  end

  test "should be valid" do
    assert @guide.valid?
  end

  test "User id should be present" do
    @guide.user_id = nil
    assert_not @guide.valid?
  end

  test "location should be present" do
    @guide.location = "    "
    assert_not @guide.valid?
  end

  test "location should not be too long" do
    @guide.location = "a" * 51
    assert_not @guide.valid?
  end

end
