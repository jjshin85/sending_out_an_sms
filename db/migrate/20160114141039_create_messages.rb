class CreateMessages < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :content, null: false
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.integer :job_id, null: false
      t.timestamps
    end
  end
end