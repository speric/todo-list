require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can't create a user with no email address" do
    user = User.new
    user.email_address = ""
    assert !user.save
  end

  test "can't create user with invalid email address" do
    user = User.new
    user.email_address = "eric"
    assert !user.save
  end

  test "can create user with valid email address" do
    user = User.new
    user.email_address = "eric@prudentiadigital.com"
    assert user.save
  end

  test "can't create user whose email address already exists" do
    user = User.new
    user.email_address = "speric@gmail.com"
    assert !user.save #user already in db via fixtures
  end
end
