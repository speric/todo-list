class AddIndexes < ActiveRecord::Migration
  def up
    add_index :items, :user_id
    add_index :items, :completed
    add_index :items, :sort_order
    
    add_index :users, :email_address
    add_index :users, :persistence_token
  end

  def down
  end
end
