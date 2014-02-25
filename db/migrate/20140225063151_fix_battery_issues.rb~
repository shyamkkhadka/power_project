class FixBatteryIssues < ActiveRecord::Migration
  def up
		add_column :batteries, :battery_model_id, :integer unless Battery.column_names.include?('battery_model_id') 
		remove_column :batteries, :batt_rack_length if Battery.column_names.include?('batt_rack_length')
		remove_column :batteries, :batt_rack_width if Battery.column_names.include?('batt_rack_width')
		remove_column :batteries, :batt_rack_height if Battery.column_names.include?('batt_rack_height') 
		remove_column :batteries, :company_name
  end

  def down
		remove_column :batteries, :battery_model_id if Battery.column_names.include?('battery_model_id')
		add_column :batteries, :company_name
  end
end
