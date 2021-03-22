class RenameEaryLeavingColumnToAttendances < ActiveRecord::Migration[6.0]
  def change
    rename_column :attendances, :eary_leaving, :early_leaving
  end
end
