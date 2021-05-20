class AddLeavingPlaceToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :leaving_place, :string
  end
end
