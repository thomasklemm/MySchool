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

school_year = school.school_years.create! do |y|
  y.name = 'Schuljahr 2013/2014'
  y.starts_on = '2013-08-01'.to_date
  y.ends_on = '2014-07-31'.to_date
end

p "SchoolYear Create: #{ school_year.name }"

teacher = school.teachers.create! do |t|
  t.last_name = 'Fleischmann'
  t.first_name = 'Roland'
  t.form_of_address = 'Herr'
  t.gender = 'männlich'
  t.date_of_birth = '02.04.1956'.to_date
  t.email = 'roland.fleischmann@jack-steinberger-gymnasium.de'
  t.shorthand_symbol = 'fle'
end

p "Teacher Create: #{ teacher.name }"

teacher = school.teachers.create! do |t|
  t.last_name = 'Ganzleben'
  t.first_name = 'Stefan'
  t.form_of_address = 'Herr'
  t.gender = 'männlich'
  t.date_of_birth = '01.01.1980'.to_date
  t.email = 'stefan.ganzleben@jack-steinberger-gymnasium.de'
  t.shorthand_symbol = 'gan'
end

p "Teacher Create: #{ teacher.name }"

student = school.students.create! do |t|
  t.last_name = 'Klemm'
  t.first_name = 'Thomas'
  t.form_of_address = 'Herr'
  t.gender = 'männlich'
  t.date_of_birth = '03.08.1988'.to_date
  t.email = 'thomas@tklemm.eu'
end

p "Student Create: #{ student.name }"

student = school.students.create! do |t|
  t.last_name = 'Deuchert'
  t.first_name = 'Benedikt'
  t.form_of_address = 'Herr'
  t.gender = 'männlich'
  t.date_of_birth = '06.03.1989'.to_date
  t.email = 'benedikt@deuchert.org'
end

p "Student Create: #{ student.name }"
