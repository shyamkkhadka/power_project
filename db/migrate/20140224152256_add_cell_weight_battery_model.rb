class AddCellWeightBatteryModel < ActiveRecord::Migration
  def up
    add_column :battery_models, :cell_weight, :float
  end

  def down
    remove_column :battery_models, :cell_weight
  end
end
