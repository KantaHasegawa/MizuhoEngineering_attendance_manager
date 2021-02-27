class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.time :attendance_time
      t.time :leaving_time
      t.date :date

      t.timestamps
    end
  end
end
