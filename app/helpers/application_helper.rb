module ApplicationHelper
	
	# List all system types availaible in Nepal Telecom
	def system_types
		SystemType.pluck("name")
	end

	# List all regional_directorate codes
	def regional_directorates
		RegionalDirectorate.pluck("code")
	end
	
	# List all acc offices, setting KRD as default
	def acc_offices(rd_code)
		RegionalDirectorate.find_by_code(rd_code).accounting_offices.pluck("name")
	end

end
