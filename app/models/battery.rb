class Battery < ActiveRecord::Base
 									
	validates :company_name, :presence => true
  #:uniqueness => true
  validates :bank_no , :numericality => true
	
	attr_accessible :bank_no, :capacity, :company_name, :fist_installation_date, :installation_date, 
	:installation_team, :remarks, :station_id, :system_type_id
		
	belongs_to :station
	belongs_to :system_type
	has_many :battery_daily_tests, :dependent => :destroy
	has_many :battery_weekly_tests, :dependent => :destroy

	# Check if daily test report is already entered or not
	def daily_test_report_entered?
		true if self.battery_daily_tests.pluck("created_at").collect! { |x| x.to_date }.include?(Date.current)
	end

		# Check if weekly test report is already entered or not
	def weekly_test_report_entered?
		true if self.battery_weekly_tests.pluck("created_at").collect! { |x| x.to_date }.include?(Date.current)
	end

	HUMANIZED_ATTRIBUTES = {
    :bank_no => "No. of banks",
		:company_name => "Manufacturer's name"
  }

  def self.human_attribute_name(attr, options={})
		HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	end
	
end
