class Generator < ActiveRecord::Base

	# Inherits all the attributes of model Equipment
	acts_as :equipment, :as => :equipmentable

  attr_accessible :air_filter, :alternator_manufacturer, :alternator_model_no, :alternator_serial_no,
	:company_name, :control_panel_height, :control_panel_length, :control_panel_width, :cooling_type, 
	:engine_manufacturer, :engine_model_no, :engine_oil_type, :engine_serial_no, :eqp_code, :first_installation_date, 
	:fuel_filter,	:genset_height, :genset_length, :genset_weight, :installation_team, :model_no, :oil_sumo_capacity,
	:sec_fuel_filter, :sound_level, :starter_battery_capacity, :station_id, :system_type_id, :gen_type, :water_filter,
	:remarks

	validates :company_name, :presence => true
	
	belongs_to :station
	belongs_to :system_type
	
	# Display Team members name, from User IDs stored in installation_team field
	def team_members
		User.where(:id => self.installation_team.split(",")).pluck(:full_name).join(",")
	end
end


