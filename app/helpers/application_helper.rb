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
		if rd_code == 'ALL'
		 AccountingOffice.pluck("name")			
		else
			RegionalDirectorate.find_by_code(rd_code).accounting_offices.pluck("name")	
		end
	end

		# Display Team members name, from User IDs stored in installation_team field
	def team_members(obj)
		User.where(:id => obj.installation_team.split(",")).pluck(:full_name).join(",")
	end
	
end
