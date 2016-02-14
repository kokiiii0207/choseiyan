class AddDeatailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :schedule_id, :integer
    add_column :users, :comment, :text
  end
end
