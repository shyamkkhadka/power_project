class BatteryWeeklyTest < ActiveRecord::Base
  attr_accessible :battery_id, :cell_voltage
	belongs_to :battery
end
