class RemoveColumnFromWorkingPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :working_places, :latitude, :integer
    remove_column :working_places, :longitude, :integer
  end
end
