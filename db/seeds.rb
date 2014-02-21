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
