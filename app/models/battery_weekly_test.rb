class BatteryWeeklyTest < ActiveRecord::Base
  attr_accessible :battery_id, :cell_voltage, :bank_id, :visual_inspection, :cell_id, :inserted_by
	belongs_to :battery
	
	# TODO: Change cell_voltage data type to text type from string
	#serialize :cell_voltage

end
