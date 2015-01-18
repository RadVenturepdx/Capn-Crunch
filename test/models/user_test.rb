require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # Using Michael Hartl examples from railstutorial.org book

  def setup
    @user = User.new(name: "Example User", email: "user7@example.com",
                     phone_number: "503-555-4353", age: 32, password: "foobar",
                     password_confirmation: "foobar", profile: 'Profile',
                     address: '123 Main St', city: 'Anytown', state: 'AL',
                     zipcode: '97124', country: 'USA')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "age should be present" do
    @user.age = nil
    assert_not @user.valid?
  end

  test "phone number should be present" do
    @user.phone_number = "    "
    assert_not @user.valid?
  end

  test "profile should be present" do
    @user.profile = "    "
    assert_not @user.valid?
  end

  test "address should be present" do
    @user.address = "    "
    assert_not @user.valid?
  end

  test "city should be present" do
    @user.city = "    "
    assert_not @user.valid?
  end

  test "state should be present" do
    @user.state = "    "
    assert_not @user.valid?
  end

  test "zipcode should be present" do
    @user.zipcode = "    "
    assert_not @user.valid?
  end

  test "country should be present" do
    @user.country = "    "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "age should not be too high" do
    @user.age = 1234
    assert_not @user.valid?
  end

  test "address should not be too long" do
    @user.address = "a" * 51
    assert_not @user.valid?
  end

  test "city should not be too long" do
    @user.city = "a" * 31
    assert_not @user.valid?
  end

  test "state should not be too long" do
    @user.state = "a" * 31
    assert_not @user.valid?
  end

  test "zipcode should not be too long" do
    @user.zipcode = "3" * 11
    assert_not @user.valid?
  end

  test "zipcode should not be too short" do
    @user.zipcode = "a" * 4
    assert_not @user.valid?
  end

  test "country should not be too long" do
    @user.country = "a" * 51
    assert_not @user.valid?
  end

  test "age should be too low" do
    @user.age = -2
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                        foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # In addition to this we added database indices to avoid duplicates
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "phone number should have a minimum length" do
    @user.phone_number = @user.phone_number = "2" * 9
    assert_not @user.valid?
  end

  test "profile should have a maximum length" do
    @user.profile = "b" * 1000
    assert_not @user.valid?
  end
end
