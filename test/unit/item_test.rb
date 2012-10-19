require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "can't create a blank item" do
    item = Item.new
    assert !item.save
  end

  test "can't create an item without a title" do
    item = Item.new
    item.user_id = users(:eric).id
    item.description = "I need to take out the trash or my wife will kill me."
    item.due_date = Time.now + 3.days
    assert !item.save
  end

  test "can create an item with just a title" do
    item = Item.new
    item.user_id = users(:eric).id
    item.title = "Take out the trash"
    assert item.save
  end

  test "can create an item with just a title and description" do
    item = Item.new
    item.user_id = users(:eric).id
    item.title = "Take out the trash"
    item.description = "I need to take out the trash or my wife will kill me."
    assert item.save
  end

  test "can create an item with just a title and due date" do
    item = Item.new
    item.user_id = users(:eric).id
    item.title = "Take out the trash"
    item.due_date = Time.now + 3.days
    assert item.save
  end

  test "can create an item with all fields" do
    item = Item.new
    item.user_id = users(:eric).id
    item.title = "Take out the trash"
    item.description = "I need to take out the trash or my wife will kill me."
    item.due_date = Time.now + 3.days
    assert item.save
  end
end
