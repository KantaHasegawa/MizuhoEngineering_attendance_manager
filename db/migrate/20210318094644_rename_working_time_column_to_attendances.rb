class RenameWorkingTimeColumnToAttendances < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendances, :working_time, :working_times
  end
end
