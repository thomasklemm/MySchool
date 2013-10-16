class School < ActiveRecord::Base
  has_many :school_years
  belongs_to :default_school_year, class_name: 'SchoolYear'
  has_many :teachers
  belongs_to :headmaster, class_name: 'Teacher'
  belongs_to :deputy_headmaster, class_name: 'Teacher'
  has_many :students
  has_many :parents
  validates :name, presence: true
end
