class ChangeJoinStatusColumn < ActiveRecord::Migration
  def change
    remove_column :plans_dates, :joins_status, :boolean
    add_column :plans_dates, :join_status, :integer 
  end
end
