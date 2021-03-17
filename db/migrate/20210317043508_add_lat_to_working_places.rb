class AddLatToWorkingPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :working_places, :latitude, :integer
    add_column :working_places, :longitude, :integer
  end
end
