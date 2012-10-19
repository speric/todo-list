require 'test_helper'

class UserSessionTest < ActiveSupport::TestCase
  setup :activate_authlogic
  
  test "can create a user session with a valid user" do
    assert UserSession.create(users(:eric)) 
  end
end
