class AccountingOffice < ActiveRecord::Base
  attr_accessible :name, :regional_directorate_id
	
	belongs_to :regional_directorate
	has_many :stations
end
