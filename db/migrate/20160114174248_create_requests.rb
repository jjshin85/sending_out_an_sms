class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :friender_id, null: false
      t.integer :friendee_id, null: false
      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
