class SystemType < ActiveRecord::Base
  attr_accessible :name
	
	has_many :batteries
	has_many :rectifiers
	has_many :generators

end
