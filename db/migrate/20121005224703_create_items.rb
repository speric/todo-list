class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.text :description, :null => true
      t.boolean :completed, :null => false, :default => false
      t.integer :sort_order, :null => true, :default => 0
      t.date :due_date, :null => true
      t.timestamps
    end
  end
end
