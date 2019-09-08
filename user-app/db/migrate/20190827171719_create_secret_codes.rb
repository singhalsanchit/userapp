class CreateSecretCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :secret_codes do |t|
    	t.integer :user_id, :null => true
      t.string :code, :null => true
      t.timestamps
    end
  end
end
