class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :email_address,       :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
      t.timestamps
    end
  end
end