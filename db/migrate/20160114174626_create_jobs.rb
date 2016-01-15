class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.datetime :send_date, null: false
      t.references :message, null: false
    end
  end
end
