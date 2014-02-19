class Station < ActiveRecord::Base
  
	attr_accessible :inc_address, :inc_cell, :inc_name, :name, :remarks, :regional_directorate_id, 
	:accounting_office_id

  validates :name, :presence => true, :uniqueness => true
  validates :inc_name, :presence => true
  
  belongs_to :regional_directorate
	belongs_to :accounting_office
  has_many :batteries,  :dependent => :destroy 
  has_many :rectifiers,  :dependent => :destroy 
  has_many :generators,  :dependent => :destroy 
	has_and_belongs_to_many :users	

end
