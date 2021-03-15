class RemoveUserIdFromWorkingPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :working_places, :user_id, :integer
  end
end
