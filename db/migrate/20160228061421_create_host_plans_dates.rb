class CreateHostPlansDates < ActiveRecord::Migration
  def change
    create_table :host_plans_dates do |t|
      t.integer :schedule_id
      t.date :host_nominated_day
      t.timestamps null: false
    end
  end
end
