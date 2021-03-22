class AddTimesToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :attendance_time, :datetime
    add_column :attendances, :leaving_time, :datetime
  end
end
