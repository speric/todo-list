require "test_helper"

class CreatingItemsTest < ActionDispatch::IntegrationTest
  def test_creating_items_with_existing_list
    login

    get "/items"
    assert_select "select[name='item[list_id]']"
    list = List.create(:name => "First List", :user_id => @user.id)
    post "/items", :item => {:title => "Yay", :list_id => list.id}
    follow_redirect!
    assert_equal "/items", path
    item = Item.order("id DESC").first
    assert_equal item.list_id, list.id
  end

  def login
    @user = User.create(email_address: "test@example.com")
    post "/user_sessions", :user_session => {:email_address => "test@example.com"}
    follow_redirect!
    assert_equal "/items", path
  end
end
