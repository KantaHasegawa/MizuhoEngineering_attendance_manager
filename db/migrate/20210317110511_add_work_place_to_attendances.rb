class AddWorkPlaceToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :work_place, :string
  end
end
