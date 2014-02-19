class AccountingOffice < ActiveRecord::Base
  attr_accessible :name, :regional_directorate_id
  
  validates :name, :presence => true, :uniqueness => true

	
	belongs_to :regional_directorate
	has_many :stations
end
