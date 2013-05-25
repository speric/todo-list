class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.timestamps
    end
    
    add_index :lists, :user_id
  end
end
