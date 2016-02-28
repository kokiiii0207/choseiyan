class CreatePlansDates < ActiveRecord::Migration
  def change
    create_table :plans_dates do |t|
      t.integer :schedule_id
      t.integer :user_id
      t.boolean :joins_status
      t.boolean :host_flag
      t.date :nominated_day


      t.timestamps null: false
    end
  end
end
