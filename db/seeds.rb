# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create system type and regional directorates
SystemType.create([{ name: 'PSTN' }, { name: 'GSM' }, { name: 'CDMA' }, { name: 'IT' }, { name: 'WIMAX' }, { name: 'Repeater'},{ name: 'Optical' }] )
RegionalDirectorate.create([
                           { code: 'ERD', name: 'Eastern Regional Directorate', city: 'Biratnagar', zone: 'Koshi', district: 'Morang'},
                           { code: 'CRD', name: 'Central Regional Directorate', city: 'Birgunj', zone: 'Narayani', district: 'Parsa'},
                           { code: 'KRD', name: 'Kathmandu Regional Directorate', city: 'Kathmandu', zone: 'Bagmati', district: 'Kathmandu'},
                           { code: 'WRD', name: 'Western Regional Directorate', city: 'Bhairawaha', zone: 'Lubmini', district: 'Bhairawaha'},
                           { code: 'MWRD', name: 'Mid Western Regional Directorate', city: 'Nepalgunj', zone: 'Bheri', district: 'Nepalgunj'},
                           { code: 'FWRD', name: 'Far Western Regional Directorate', city: 'Attariya', zone: 'Seti', district: 'Dhangadi'}
                           ])

# Predefine some roles
# Role.create([ { name: "admin" }, { name: "station_user" }, { name: "regional_user" }, { name: "accounting_user" }, { name: "manager" } ])

# For first deployment, only two roles are taken in account
Role.create([ { name: "admin" }, { name: "station_user" } ])

# Create an admin user
User.create(email: "shyam.khadka@ntc.net.np", full_name: "shyam krishna khadka", emp_id: 7297, cell_no: 9851166969, role: "admin", password: '12345', :name_emp_id => 'shyam krishna khadka-7297')
User.first.roles.push(Role.first)
