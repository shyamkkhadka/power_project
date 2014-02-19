class Rectifier < ActiveRecord::Base
	
	# Inherits all the attributes of model Equipment
	acts_as :equipment, :as => :equipmentable					
	
	attr_accessible :first_installation_date, :installation_date, :installation_team, :manufacturer_name, 
	:module_no, :remarks, :serial_no, :station_id, :system_type_id, :total_capacity, :cab_length, :cab_width, 
  :cab_height, :cab_weight, :module_length, :module_width, :module_height, :module_weight

	#validates :manufacturer_name, :presence => true
  validates :module_no, :presence => true, :numericality => true
  validates :serial_no, :presence => true
 	validates :module_no, :presence => true

	belongs_to :station
	belongs_to :system_type

end

