class RemoveWorkingTimeFromAttendances < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :working_time, :time
  end
end
