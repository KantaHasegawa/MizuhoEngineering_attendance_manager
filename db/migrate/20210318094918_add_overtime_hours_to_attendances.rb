class AddOvertimeHoursToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :overtime_hours, :integer
  end
end
