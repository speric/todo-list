require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "cannot save List with no user_id" do
    list = List.new
    list.name = "Some List"
    assert !list.save
  end

  test "cannot save List with no name" do
    list = List.new
    list.user_id = users(:eric).id
    assert !list.save
  end

  test "can save List with valid fields" do
    list = List.new
    list.user_id = users(:eric).id
    list.name = "Some List"
    assert list.save
  end
end
