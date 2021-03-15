class CreateWorkingPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :working_places do |t|
      t.integer :user_id
      t.string :addres

      t.timestamps
    end
  end
end
