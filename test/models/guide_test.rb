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
  end

  test "should be valid" do
    assert @guide.valid?
  end

  test "User id should be present" do
    @guide.user_id = nil
    assert_not @guide.valid?
  end

  test "rate should be present" do
    @guide.rate = nil
    assert_not @guide.valid?
  end

  test "hood should be boolean" do
    @guide.hood = nil
    assert_not @guide.valid?
  end

  test "bachelor should be boolean" do
    @guide.bachelor = nil
    assert_not @guide.valid?
  end

  test "whistler should be boolean" do
    @guide.whistler = nil
    assert_not @guide.valid?
  end

  test "downhill should be boolean" do
    @guide.downhill = nil
    assert_not @guide.valid?
  end

  test "crosscountry should be boolean" do
    @guide.crosscountry = nil
    assert_not @guide.valid?
  end

  test "snowboard should be boolean" do
    @guide.snowboard = nil
    assert_not @guide.valid?
  end
  test "rate should be at least 0" do
    @guide.rate = -1
    assert_not @guide.valid?
  end

  test "rate should not higher than 999" do
    @guide.rate = 1000
    assert_not @guide.valid?
  end

  test "Sunday availability should be present" do
    @guide.sun_avail = nil
    assert_not @guide.valid?
  end

  test "Monday availability should be present" do
    @guide.mon_avail = nil
    assert_not @guide.valid?
  end

  test "Tuesday availability should be present" do
    @guide.tues_avail = nil
    assert_not @guide.valid?
  end

  test "Wednesday availability should be present" do
    @guide.wed_avail = nil
    assert_not @guide.valid?
  end

  test "Thursday availability should be present" do
    @guide.thurs_avail = nil
    assert_not @guide.valid?
  end

  test "Friday availability should be present" do
    @guide.fri_avail = nil
    assert_not @guide.valid?
  end

  test "Saturday availability should be present" do
    @guide.sat_avail = nil
    assert_not @guide.valid?
  end

  test "Sunday availability should not be too long" do
    @guide.sun_avail = 'a'* 41
    assert_not @guide.valid?
  end

  test "Monday availability should not be too long" do
    @guide.mon_avail = 'a'* 41
    assert_not @guide.valid?
  end

  test "Tuesday availability should not be too long" do
    @guide.tues_avail = 'a'* 41
    assert_not @guide.valid?
  end

  test "Wednesday availability should not be too long" do
    @guide.wed_avail = 'a'* 41
    assert_not @guide.valid?
  end

  test "Thursday availability should not be too long" do
    @guide.thurs_avail = 'a'* 41
    assert_not @guide.valid?
  end

  test "Friday availability should not be too long" do
    @guide.fri_avail = 'a'* 41
    assert_not @guide.valid?
  end

  test "Saturday availability should not be too long" do
    @guide.sat_avail = 'a'* 41
    assert_not @guide.valid?
  end

end
