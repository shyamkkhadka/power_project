class CreateBatteryModels < ActiveRecord::Migration
  def change
		drop_table :battery_models if self.table_exists?("battery_models") 
    create_table :battery_models do |t|
      t.string :name
      t.float :batt_rack_length
      t.float :batt_rack_width
      t.float :batt_rack_height
      t.float :batt_rack_weight
      t.float :cell_length
      t.float :cell_width
      t.float :cell_height
      t.string :manufacturer_name
      t.float :capacity

      t.timestamps
    end
  end
end
