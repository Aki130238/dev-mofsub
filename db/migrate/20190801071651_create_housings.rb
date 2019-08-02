class CreateHousings < ActiveRecord::Migration[5.0]
  def change
    create_table :housings do |t|
      t.string :build
      t.integer :rent
      t.string :add
      t.integer :year
      t.text :remarks

      t.timestamps
    end
  end
end
