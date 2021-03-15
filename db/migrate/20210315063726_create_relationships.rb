class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :user_id, null:false
      t.integer :working_place_id, null:false

      t.timestamps
    end
  end
end
