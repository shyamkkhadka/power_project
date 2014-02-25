class BatteryModel < ActiveRecord::Base
 
 validates :name, :presence => true
 validates :name, :uniqueness => true
 validates :manufacturer_name, :presence => true
 validates :capacity, :presence => true

 attr_accessible :batt_rack_height, :batt_rack_length, :batt_rack_weight, :batt_rack_width, :capacity, 
                  :cell_height, :cell_length, :cell_width, :manufacturer_name, :name, :cell_weight
  
  has_many :batteries
  
end
