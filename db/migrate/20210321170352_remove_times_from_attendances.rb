class RemoveTimesFromAttendances < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :attendance_time, :time
    remove_column :attendances, :leaving_time, :time
  end
end
