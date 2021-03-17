class AddColumnToWorkingPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :working_places, :latitude, :float
    add_column :working_places, :longitude, :float
  end
end
