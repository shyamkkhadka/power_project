class Battery < ActiveRecord::Base
  									
	attr_accessible :bank_no, :capacity, :company_name, :fist_installation_date, :installation_date, 
	:installation_team, :remarks, :station_id, :system_type_id
	
	validates :company_name, :presence => true
  #:uniqueness => true
  validates :bank_no , :numericality => true
	
	belongs_to :station
	belongs_to :system_type

end
