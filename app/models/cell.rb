class Cell < ActiveRecord::Base
  attr_accessible :cell_voltage, :visual_inpsection
  
  belongs_to :bank
end

