class ChangeAttendanceTimeToAttendances < ActiveRecord::Migration[6.0]
  def change
    change_column :attendances, :attendance_time, :datetime
    change_column :attendances, :leaving_time, :datetime
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
