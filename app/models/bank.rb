class Bank < ActiveRecord::Base
  attr_accessible :battery_id, :cells, :total_voltage, :visual_inpsection
	
	belongs_to :battery
	has_many :cells, :dependent => :destroy
end

