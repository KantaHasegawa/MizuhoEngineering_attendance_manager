class AddDateToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :year, :integer
    add_column :attendances, :month, :integer
    add_column :attendances, :day, :integer
  end
end
