class RenameWorkPlaceColumnToAttendances < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendances, :work_place, :working_place
  end
end
