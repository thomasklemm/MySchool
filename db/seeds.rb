# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_date_between(start_year, end_year)
  year = (start_year..end_year).to_a.sample
  month = (rand * 12).ceil
  day = (rand * 31).ceil

  Time.local(year, month, day).to_date
end

def random_shorthand(length)
  (1..3).map { random_character }.join
end

def random_character
  (10 + rand(26)).to_s(36)
end

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

KLASS_NAMES = %w(5a 5b 5c 5d 5e 6a 6b 6c 6d 6e 7a 7b 7c 7d 7e 8a 8b 8c 8d 8e 9a 9b 9c 9d 9e 10a 10b 10c 10d 10e)
klasses = KLASS_NAMES.each_with_object([]) do |name, ary|
  ary << school_year.klasses.create! do |k|
    k.name = name
  end
end

# p "Klass Create: #{ klasses.map(&:name).to_sentence }"

# teacher = school.teachers.create! do |t|
#   t.last_name = 'Fleischmann'
#   t.first_name = 'Roland'
#   t.form_of_address = 'Herr'
#   t.gender = 'männlich'
#   t.date_of_birth = '02.04.1956'.to_date
#   t.email = 'roland.fleischmann@jack-steinberger-gymnasium.de'
#   t.shorthand_symbol = 'fle'
# end

# p "Teacher Create: #{ teacher.name }"

# teacher = school.teachers.create! do |t|
#   t.last_name = 'Ganzleben'
#   t.first_name = 'Stefan'
#   t.form_of_address = 'Herr'
#   t.gender = 'männlich'
#   t.date_of_birth = '01.01.1980'.to_date
#   t.email = 'stefan.ganzleben@jack-steinberger-gymnasium.de'
#   t.shorthand_symbol = 'gan'
# end

# p "Teacher Create: #{ teacher.name }"

60.times do
  teacher = school.teachers.create! do |t|
    t.last_name = Faker::NameDE.last_name
    t.first_name = Faker::NameDE.first_name
    t.form_of_address = %w(Herr Frau).sample
    t.gender = %w(männlich weiblich).sample
    t.date_of_birth = random_date_between(1940, 1990)
    t.email = "#{t.name.parameterize}@example.com"
    t.shorthand_symbol = random_shorthand(3)
  end

  p "Teacher Create: #{ teacher.name }"
end

# student = school.students.create! do |t|
#   t.last_name = 'Klemm'
#   t.first_name = 'Thomas'
#   t.form_of_address = 'Herr'
#   t.gender = 'männlich'
#   t.date_of_birth = '03.08.1988'.to_date
#   t.email = 'thomas@tklemm.eu'
# end

# p "Student Create: #{ student.name }"

# student = school.students.create! do |t|
#   t.last_name = 'Deuchert'
#   t.first_name = 'Benedikt'
#   t.form_of_address = 'Herr'
#   t.gender = 'männlich'
#   t.date_of_birth = '06.03.1989'.to_date
#   t.email = 'benedikt@deuchert.org'
# end

# p "Student Create: #{ student.name }"

400.times do
  student = school.students.create! do |s|
    s.last_name = Faker::NameDE.last_name
    s.first_name = Faker::NameDE.first_name
    s.form_of_address = %w(Herr Frau).sample
    s.gender = %w(männlich weiblich).sample
    s.date_of_birth = random_date_between(1995, 2005)
    s.email = "#{s.name.parameterize}@example.com"
  end

  klass = klasses.sample
  klass.students << student

  p "Student Create: #{ student.name }"
end
