class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :hashed_password, null: false
      t.string :SID, null: false
      t.string :auth_token, null: false
      t.string :twilio_number, null: false
      t.string :raw_number, null: false
      t.timestamps
    end
  end
end
