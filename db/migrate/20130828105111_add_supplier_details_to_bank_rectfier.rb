class AddSupplierDetailsToBankRectfier < ActiveRecord::Migration
  def change
		add_column :batteries, :batt_rack_length, :number
		add_column :batteries, :batt_rack_width, :number
		add_column :batteries, :batt_rack_height, :number 	
		add_column :batteries, :batt_rack_weight, :number
		add_column :batteries, :cell_length, :number
		add_column :batteries, :cell_width, :number
		add_column :batteries, :cell_height, :number
		add_column :batteries, :cell_weight, :number

		add_column :rectifiers, :cab_length, :number
		add_column :rectifiers, :cab_width, :number
		add_column :rectifiers, :cab_height, :number
		add_column :rectifiers, :cab_weight, :number
		add_column :rectifiers, :module_length, :number
		add_column :rectifiers, :module_width, :number		
		add_column :rectifiers, :module_height, :number
		add_column :rectifiers, :module_weight, :number


  end
end