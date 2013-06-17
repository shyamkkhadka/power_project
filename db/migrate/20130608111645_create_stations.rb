class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :inc_name
      t.integer :inc_cell
      t.string :inc_address
      t.text :remarks

      t.timestamps
    end
  end
end
