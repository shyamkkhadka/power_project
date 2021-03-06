class Equipment < ActiveRecord::Base
  acts_as_superclass
 	
  attr_accessible :curr_local_agent_name, :local_agent_contact_person, 
	:local_agent_mobile, :local_agent_office_fax, :local_agent_office_phone, :supp_company_address, 
	:supp_company_fax, :supp_company_name, :supp_company_phone, :supp_remarks, :equipmentable_id, :equipmentable_type

	validates_presence_of :supp_company_name
end
