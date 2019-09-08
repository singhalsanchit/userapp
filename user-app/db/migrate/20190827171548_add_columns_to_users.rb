class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :first_name, :string, :null => true
    add_column :users, :last_name, :string, :null => true
    add_column :users, :user_name, :string, :null => true
  end
end
