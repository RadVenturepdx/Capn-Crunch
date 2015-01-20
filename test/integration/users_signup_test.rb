require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {
        name:  "",
        email: "user@invalid",
        password: "foo",
        password_confirmation: "bar",
        age: -1,
        phone_number: "",
        profile: "",
        address: "",
        city: "",
        state: "",
        zipcode: "",
        country: ""
      }
      end
      assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {
        name:  "Example User",
        email: "user@example.com",
        password: "password",
        password_confirmation: "password",
        age: 24,
        phone_number: "5035551212",
        profile: "test profile",
        address: "123 1st ave",
        city: "Portland",
        state: "OR",
        zipcode: "97123",
        country: "USA"
      }
      end
      assert_template 'users/show'
      assert is_logged_in?
  end

end
