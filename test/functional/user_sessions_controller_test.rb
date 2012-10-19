require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "accessing user_sessions#new while logged in redirects to items#index" do
    UserSession.create(users(:eric))
    get :new
    assert_redirected_to items_path
    assert_equal "You must be logged out to access this page", flash[:notice]
  end
  
  test "accessing user_sessions#new while logged out renders page" do
    get :new
    assert assigns(:user_session)
    assert_template "user_sessions/new"
  end

  test "accessing user_sessions#create while logged in redirects to items#index" do
    UserSession.create(users(:eric))
    post :create
    assert_redirected_to items_path
    assert_equal "You must be logged out to access this page", flash[:notice]
  end

  test "create valid user session with existing email render user#new" do
    post :create, :user_session => { :email_address => users(:eric).email_address }
    assert_redirected_to items_path
    assert_equal "Sign in successful", flash[:notice]
  end
  
  test "create user session with invalid email" do
    post :create, :user_session => { :email_address => "npverni@chargify.com" }
    assert_template "user_sessions/new"
    assert_select "h4.alert-heading", "There were some errors with your request:"
  end

  test "destroy user session without being logged in" do
    delete :destroy
    assert_redirected_to new_user_session_path(assigns(:user_session))
    assert_equal "You must be logged in to access this page", flash[:notice]
  end
  
  test "destroy user session while being logged in" do
    UserSession.create(users(:eric))
    delete :destroy
    assert_redirected_to :signout
    assert_equal "You've been signed out", flash[:notice]
  end
end
