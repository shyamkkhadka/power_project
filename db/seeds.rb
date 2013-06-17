# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SystemType.create([{ name: 'PSTN' }, { name: 'GSM' }, { name: 'CDMA' }, { name: 'IT' }, { name: 'WIMAX' } ])
RegionalDirectorate.create([{ code: 'KRD', name: 'Kathmandu Regional Directorate', city: 'Kathmandu', zone: 'Bagmati', district: 'Kathmandu'}, { code: 'CRD', name: 'Central Regional Directorate', city: 'Birgunj', zone: 'Narayani', district: 'Parsa'} ])
