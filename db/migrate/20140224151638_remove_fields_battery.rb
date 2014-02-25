class RemoveFieldsBattery < ActiveRecord::Migration
  def up
    remove_column :batteries, :batt_rack_weight
    remove_column :batteries, :cell_length
    remove_column :batteries, :cell_width
    remove_column :batteries, :cell_height
    remove_column :batteries, :cell_weight
  end

  def down
    add_column :batteries, :batt_rack_weight, :float
    add_column :batteries, :cell_length, :integer
    add_column :batteries, :cell_width, :integer
    add_column :batteries, :cell_height, :integer
    add_column :batteries, :cell_weight, :integer
  end
end
