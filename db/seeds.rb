# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

school = School.create! do |s|
  s.name     = 'Jack Steinberger Gymnasium'
  s.street   = 'Steinstraße 18'
  s.zip_code = '97688'
  s.town     = 'Bad Kissingen'
  s.country  = 'Deutschland'
  s.phone    = '0971/71240'
  s.fax      = '0971/712499'
  s.email    = 'direktorat@jack-steinberger-gymnasium.de'
  s.web_page = 'http://www.jack-steinberger-gymnasium.de'
end

p "School Create: #{ school.name }"
