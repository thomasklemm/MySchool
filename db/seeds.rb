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
  s.postal_code = '97688'
  s.city     = 'Bad Kissingen'
  s.country  = 'Deutschland'
  s.phone    = '0971/71240'
  s.fax      = '0971/712499'
  s.email    = 'direktorat@jack-steinberger-gymnasium.de'
  s.web_page = 'http://www.jack-steinberger-gymnasium.de'
end

p "School Create: #{ school.name }"

school_year = school.school_years.create! do |y|
  y.name       = 'Schuljahr 2013/2014'
  y.start_date = '2013-08-01'.to_date
  y.end_date   = '2014-07-31'.to_date
end

p "SchoolYear Create: #{ school_year.name }"

# Set current school year on school
school.current_school_year = school_year and school.save!

KLASS_NAMES = %w(5a 5b 6a 7a 8a 9a)
klasses = KLASS_NAMES.each_with_object([]) do |name, ary|
  ary << school_year.klasses.create! do |k|
    k.name = name
  end
end

p "Klass Create: #{ klasses.map(&:name).to_sentence }"

teachers = []
30.times do
  teachers << school.teachers.create! do |t|
    t.last_name = Faker::NameDE.last_name
    t.first_name = Faker::NameDE.first_name
    t.form_of_address = %w(Herr Frau).sample
    t.gender = %w(männlich weiblich).sample
    t.date_of_birth = random_date_between(1940, 1990)
    t.email = "#{t.name.parameterize}@example.com"
    t.shorthand_symbol = random_shorthand(3)
  end
end

p "Teacher Create: #{ teachers.size } teachers"

students = []
parents = []

90.times do
  last_name = Faker::NameDE.last_name
  family_children = []
  family_parents = []

  [2, 2, 1].sample.times do
    student = school.students.create! do |s|
      s.last_name = last_name
      s.first_name = Faker::NameDE.first_name
      s.form_of_address = %w(Herr Frau).sample
      s.gender = %w(männlich weiblich).sample
      s.date_of_birth = random_date_between(1995, 2005)
      s.email = "#{s.name.parameterize}@example.com"
    end

    klasses.sample.students << student
    family_children << student
    students << student
  end

  [2, 2, 2, 1].sample.times do
    parent = school.parents.create! do |p|
      p.last_name = last_name
      p.first_name = Faker::NameDE.first_name
      p.form_of_address = %w(Herr Frau).sample
      p.gender = %w(männlich weiblich).sample
      p.date_of_birth = random_date_between(1955, 1980)
      p.email = "#{p.name.parameterize}@example.com"
    end

    family_parents << parent
    parents << parent
  end

  family_children.each do |student|
    student.parents = family_parents
  end
end

p "Student Create: #{ students.size } students"
p "Parent Create: #{ parents.size } parents"

COURSE_NAMES = %w(Deutsch Englisch Französisch Latein Mathematik Physik Erdkunde Geschichte Wirtschaft\ und\ Recht Musik Kunst)
courses = []

Klass.find_each do |klass|
  COURSE_NAMES.each do |course_name|
    course = school_year.courses.create! do |c|
      c.name = course_name
      c.teacher = teachers.sample
    end

    klass.courses << course
    courses << course

    course.students = klass.students
  end
end

p "Course Create: #{ courses.size } courses"

tests = []
Klass.find_each do |klass|
  20.times do
    test = klass.tests.create! do |t|
      t.name = "#{%w(1 2 3 4).sample}. #{COURSE_NAMES.sample} #{%w(Schulaufgabe Stegreifaufgabe).sample}"
      t.date = school_year.weekdays.sample
      t.teacher = klass.teachers.sample
    end

    tests << test
  end
end

p "Test Create: #{tests.size} tests"
