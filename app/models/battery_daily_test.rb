class BatteryDailyTest < ActiveRecord::Base
  attr_accessible :battery_id, :total_voltage, :visual_inspection, :bank_id, :inserted_by

	belongs_to :battery
end
