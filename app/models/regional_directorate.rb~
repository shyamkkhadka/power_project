class RegionalDirectorate < ActiveRecord::Base
  attr_accessible :city, :code, :district, :name, :zone
  validates :code, :presence => true, :uniqueness => true
  validates :name, :presence => true

  has_many :stations

end
