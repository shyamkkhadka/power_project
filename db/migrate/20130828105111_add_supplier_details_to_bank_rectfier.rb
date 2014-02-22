class AddSupplierDetailsToBankRectfier < ActiveRecord::Migration
  def change
		add_column :batteries, :batt_rack_length, :float
		add_column :batteries, :batt_rack_width, :float
		add_column :batteries, :batt_rack_height, :float 	
		add_column :batteries, :batt_rack_weight, :float
		add_column :batteries, :cell_length, :float
		add_column :batteries, :cell_width, :float
		add_column :batteries, :cell_height, :float
		add_column :batteries, :cell_weight, :float

		add_column :rectifiers, :cab_length, :float
		add_column :rectifiers, :cab_width, :float
		add_column :rectifiers, :cab_height, :float
		add_column :rectifiers, :cab_weight, :float
		add_column :rectifiers, :module_length, :float
		add_column :rectifiers, :module_width, :float		
		add_column :rectifiers, :module_height, :float
		add_column :rectifiers, :module_weight, :float


  end
end
