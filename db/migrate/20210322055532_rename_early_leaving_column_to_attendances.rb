class RenameEarlyLeavingColumnToAttendances < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendances, :early_leaving, :late_leaving
  end
end
