class AddRestTimesToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :rest_times, :integer, default: 1
  end
end
