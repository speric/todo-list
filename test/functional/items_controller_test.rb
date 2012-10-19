require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "accessing items#index while not logged in redirects to sign in" do
    get :index
    assert_redirected_to new_user_session_path(assigns(:user_session))
    assert_equal "You must be logged in to access this page", flash[:notice]
  end

  test "accessing items#index while logged in renders page" do
    UserSession.create(users(:eric))
    get :index
    assert_template "items/index"
    assert assigns(:items)
  end

  test "accessing items#new while logged in throws no errors page" do
    UserSession.create(users(:eric))
    get :new
    assert_template "items/new"
    assert assigns(:item)
  end

  test "creating an invalid item returns to items#new" do
    UserSession.create(users(:eric))
    post :create, :item => {}
    assert_template "items/new"
    assert_select "h4.alert-heading", "There were some errors with your request:"
  end

  test "creating a valid item throws no errors and returns to items#index" do
    UserSession.create(users(:eric))
    post :create, :item => { :title => "Mow the lawn", :user_id => users(:eric).id }
    assert_redirected_to items_path
  end

  test "marking an item as complete" do
    UserSession.create(users(:eric))
    post :mark_as_complete, :id => items(:one).id
    assert_redirected_to items_path
    assert_equal flash[:notice], "Item marked as complete."
  end
end