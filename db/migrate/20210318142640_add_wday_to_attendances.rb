class AddWdayToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :wday, :string
  end
end
