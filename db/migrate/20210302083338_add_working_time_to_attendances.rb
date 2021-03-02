class AddWorkingTimeToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :working_time, :integer
  end
end
