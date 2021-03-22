class AddColumnToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :early_attendance, :integer
    add_column :attendances, :eary_leaving, :integer
    add_column :attendances, :date, :date
  end
end
