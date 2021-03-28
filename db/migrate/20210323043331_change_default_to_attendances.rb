class ChangeDefaultToAttendances < ActiveRecord::Migration[6.0]
  def change
    change_column_default :attendances, :rest_times, from: 1, to: 60
  end
end
