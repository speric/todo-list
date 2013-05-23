class AddListIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :list_id, :integer, :null => true
    add_index :items, :list_id
  end
end
