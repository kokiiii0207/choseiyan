class AddDetailsToSchedule < ActiveRecord::Migration
  def change
   add_column :schedules, :title, :string
   add_column :schedules, :comment, :string
   add_column :schedules, :individual_url, :string 
  end
end
