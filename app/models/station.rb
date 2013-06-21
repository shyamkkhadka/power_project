class Station < ActiveRecord::Base
  attr_accessible :inc_address, :inc_cell, :inc_name, :name, :remarks, :regional_directorate_id

  validates :name, :presence => true, :uniqueness => true
  validates :inc_name, :presence => true
  
  belongs_to :regional_directorate
  has_many :batteries,  :dependent => :destroy 
  has_many :rectifiers,  :dependent => :destroy 


end
