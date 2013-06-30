class Rectifier < ActiveRecord::Base
	attr_accessible :first_installation_date, :installation_date, :installation_team, :manufacturer_name, :module_no, :remarks, 
	:serial_no, :station_id, :system_type_id, :total_capacity

	validates :manufacturer_name, :presence => true
  validates :module_no, :presence => true, :numericality => true
  validates :serial_no, :presence => true
 	validates :module_no, :presence => true

	belongs_to :station
	belongs_to :system_type

end

