class CreateNearStations < ActiveRecord::Migration[5.0]
  def change
    create_table :near_stations do |t|
      t.string :line
      t.string :station
      t.integer :walk
      t.references :housing

      t.timestamps
    end
  end
end
