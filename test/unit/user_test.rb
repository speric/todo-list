require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "can't create user with invalid email address" do
     user = User.new
     user.email_address = "speric"
     assert !user.save
   end

   test "can create user with valid email address" do
     user = User.new
     user.email_address = "speric@gmail.com"
     assert user.save
   end
end
