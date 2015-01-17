require 'test_helper'

class GuideTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User2", email: "user2@example.com",
                       phone_number: "503-555-4353", age: 32, password: "foobar",
                       password_confirmation: "foobar", profile: 'Profile')
    #@guide = @user.guides.build(location: "Mount Hood Meadows")
    @guide = Guide.new(user_id: @user.id, location: 'Mount Hood Meadows')
    @guide.id = @user.id
  end

  # This test fails and I cannot figure out why
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
